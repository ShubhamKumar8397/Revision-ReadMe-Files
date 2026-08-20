# Shell Redirection in Linux — Complete Guide

Redirection lets you control where a command's input comes from and where its output goes — instead of the default terminal screen and keyboard, you can send data to/from files, other commands, or even discard it entirely.

---

## 1. The Three Standard Streams (Foundation)

Before redirection makes sense, you need to know every process starts with three open file descriptors:

| Stream | Name           | File Descriptor | Default destination |
|--------|----------------|------------------|----------------------|
| stdin  | Standard Input | `0`              | Keyboard             |
| stdout | Standard Output| `1`              | Terminal screen      |
| stderr | Standard Error | `2`              | Terminal screen      |

Both stdout and stderr print to your screen by default, which is why errors and normal output look mixed together unless you separate them.

```bash
ls existing_file missing_file
```
```
existing_file          # stdout
ls: cannot access 'missing_file': No such file or directory   # stderr
```

Both lines appeared on your screen, but they came from **different streams** — that distinction is the entire basis of redirection.

---

## 2. Output Redirection (`>` and `>>`)

### `>` — Redirect stdout, **overwrite**

```bash
echo "Hello World" > file.txt
```
- Creates `file.txt` if it doesn't exist
- **Overwrites** it completely if it does exist — previous content is gone

**Real-life example:**
```bash
ls -la /var/log > log_listing.txt
```
Saves the current directory listing to a file, replacing any old listing each time you run it — useful for daily snapshots where you only care about the latest state.

### `>>` — Redirect stdout, **append**

```bash
echo "New line" >> file.txt
```
- Creates the file if it doesn't exist
- **Appends** to the end if it does exist — nothing is lost

**Real-life example:**
```bash
echo "$(date): Backup completed" >> /var/log/backup.log
```
This is the standard pattern for logging — every run adds a new line instead of destroying history.

> ⚠️ **Common mistake:** using `>` inside a loop or cron job when you meant `>>`. This silently wipes your log file on every run.

---

## 3. Input Redirection (`<`)

Feeds a file's contents into a command's **stdin**, instead of the command reading from the keyboard.

```bash
sort < names.txt
```
Instead of typing names manually, `sort` reads directly from `names.txt`.

**Real-life example:**
```bash
mysql -u root -p database_name < schema.sql
```
Feeds an entire SQL script into the `mysql` client — this is exactly how database dumps/schemas are restored in real deployments.

```bash
wc -l < access.log
```
Counts lines in the file without printing the filename in the output (compare to `wc -l access.log`, which prints `access.log` alongside the count).

---

## 4. Error Redirection (`2>` and `2>>`)

Since stderr is file descriptor `2`, you redirect it explicitly by prefixing with `2`.

### `2>` — Redirect stderr, overwrite

```bash
find / -name "*.conf" 2> errors.txt
```
All the `Permission denied` noise from `find` goes into `errors.txt`, while matching results still print normally to the screen.

### `2>>` — Redirect stderr, append

```bash
./deploy.sh 2>> deploy_errors.log
```
Keeps a running history of every failed deployment attempt instead of overwriting it each time.

### Discard errors entirely — `/dev/null`

`/dev/null` is a special "black hole" file — anything written to it disappears permanently.

```bash
find / -name "*.conf" 2>/dev/null
```
Extremely common in real scripts: suppresses permission-denied clutter so you only see actual matches.

---

## 5. Combining stdout and stderr

### `2>&1` — Redirect stderr to wherever stdout is currently going

```bash
command > output.txt 2>&1
```
**Order matters here.** This means:
1. First, stdout (`1`) is pointed to `output.txt`
2. Then, stderr (`2`) is pointed to **the same place stdout is currently pointing** (`&1` means "the same destination as fd 1")

Result: both normal output and errors land in `output.txt`.

❌ **Common mistake — wrong order:**
```bash
command 2>&1 > output.txt
```
Here, stderr is redirected to the terminal (where stdout was pointing *at that moment*), and only **then** is stdout sent to the file. Errors still print to your screen instead of the file. Order is evaluated left to right, so always redirect stdout first, then merge stderr into it.

### `&>` — Shorthand for redirecting both (Bash-specific)

```bash
command &> output.txt
```
Equivalent to `command > output.txt 2>&1`, but shorter. Also overwrites.

### `&>>` — Append both stdout and stderr

```bash
command &>> output.txt
```

**Real-life example — the most common pattern in cron jobs and deployment scripts:**
```bash
0 2 * * * /home/user/backup.sh > /var/log/backup.log 2>&1
```
Captures everything — success messages and errors — into one log file, so when a cron job silently fails, you have a complete record instead of nothing (cron emails/discards output that isn't redirected).

### Sending stdout to stderr — `1>&2`

```bash
echo "Something went wrong" 1>&2
```
Used inside scripts to correctly classify a message as an error, so it doesn't get mixed into stdout that another program or pipe might be consuming.

**Real-life example:**
```bash
if [[ ! -f "$config_file" ]]; then
    echo "Error: config file not found" 1>&2
    exit 1
fi
```
If this script's stdout is piped elsewhere (`./script.sh | grep something`), the error message still reaches the terminal instead of being swallowed by the pipe.

---

## 6. Here Documents (`<<`)

Feeds **multi-line** input directly into a command without needing a separate file.

```bash
cat << EOF
Line 1
Line 2
Line 3
EOF
```
`EOF` is just a marker (you can name it anything) — everything between the two `EOF` lines becomes stdin.

**Real-life example — generating a config file inline in a deployment script:**
```bash
cat << EOF > /etc/nginx/sites-available/myapp
server {
    listen 80;
    server_name example.com;
    root /var/www/myapp;
}
EOF
```
This writes a complete nginx config without needing a separate template file — very common in provisioning/setup scripts.

**Real-life example — sending multiple commands to a remote server:**
```bash
ssh user@server << EOF
cd /var/www/app
git pull
systemctl restart app
EOF
```
Runs all three commands sequentially on the remote machine in a single SSH session.

### Variable expansion in heredocs

By default, variables **are** expanded:
```bash
name="World"
cat << EOF
Hello, $name!
EOF
```
```
Hello, World!
```

Quote the delimiter to **disable** expansion (treat everything literally):
```bash
cat << 'EOF'
Hello, $name!
EOF
```
```
Hello, $name!
```
Useful when writing a script or template that should contain a literal `$variable` reference rather than have it substituted.

### `<<-` — Allow indented heredocs

```bash
if true; then
    cat <<- EOF
	Indented line (uses a real TAB, not spaces)
	EOF
fi
```
`<<-` strips **leading tab characters** (not spaces) from each line, letting you indent the heredoc to match your script's structure without that indentation appearing in the output.

---

## 7. Here Strings (`<<<`)

Feeds a **single string** into a command's stdin — a lightweight alternative to `echo "..." | command`.

```bash
grep "error" <<< "$log_line"
```

**Real-life example:**
```bash
read -r first last <<< "John Doe"
echo "$first / $last"
```
```
John / Doe
```
Splits a string into variables without needing a temporary file or a pipe.

**Comparison:**
```bash
wc -l <<< "$variable"     # here-string, cleaner
echo "$variable" | wc -l  # pipe, spawns an extra echo process
```
The here-string version avoids launching a subshell for `echo`, which matters slightly in performance-sensitive scripts.

---

## 8. Pipes (`|`) — Not Technically Redirection, But Related

A pipe connects one command's stdout directly to another command's stdin, without touching the filesystem.

```bash
ps aux | grep nginx
```

**Real-life example — a very common troubleshooting chain:**
```bash
cat access.log | grep "500" | awk '{print $1}' | sort | uniq -c | sort -rn
```
Finds all HTTP 500 errors, extracts the IP addresses, and counts how many times each IP triggered one — a real one-liner used in log analysis.

### `tee` — Redirect **and** still see output on screen

```bash
command | tee output.txt
```
Writes to `output.txt` **and** prints to the terminal simultaneously (redirection alone only does one or the other).

```bash
command | tee -a output.txt    # append instead of overwrite
```

**Real-life example:**
```bash
long_running_build.sh | tee build.log
```
Lets you watch the build in real time while also saving the full log for later — extremely common in CI/CD and manual debugging.

---

## 9. File Descriptor Manipulation (Advanced)

You can open, duplicate, and close file descriptors manually for finer control.

### Custom file descriptors

```bash
exec 3> custom_output.txt   # open fd 3 for writing
echo "This goes to fd 3" >&3
exec 3>&-                   # close fd 3
```

**Real-life example — saving and restoring stdout inside a script:**
```bash
exec 3>&1              # save current stdout to fd 3
exec > logfile.txt      # redirect all subsequent stdout to a file
echo "This goes to the file"
exec 1>&3               # restore stdout from fd 3
echo "This goes back to the terminal"
exec 3>&-               # close fd 3, cleanup
```
This pattern lets a script redirect all its output to a log file for a section of code, then switch back to normal terminal output — useful when only part of a script needs to be logged silently.

### Redirect for the rest of the script

```bash
exec > output.log 2>&1
echo "Everything from here on is logged"
some_command
another_command
```
Instead of adding `> output.log 2>&1` to every single line, `exec` redirects for **every command that follows** in the script.

---

## 10. Process Substitution (`<(...)` and `>(...)`)

Bash-specific feature that treats a command's output as if it were a file — useful when a command expects file arguments but you only have command output.

```bash
diff <(ls dir1) <(ls dir2)
```
`diff` normally compares two files. Here, `<(ls dir1)` and `<(ls dir2)` behave like temporary files containing each command's output, letting you diff two live command results without manually creating temp files first.

**Real-life example:**
```bash
diff <(curl -s https://api.example.com/v1/config) <(curl -s https://api.example.com/v2/config)
```
Compares API responses from two endpoints directly, with no intermediate files to clean up.

---

## 11. Quick Reference Table

| Syntax        | Meaning                                      |
|---------------|-----------------------------------------------|
| `> file`      | stdout → file (overwrite)                     |
| `>> file`     | stdout → file (append)                        |
| `< file`      | file → stdin                                  |
| `2> file`     | stderr → file (overwrite)                     |
| `2>> file`    | stderr → file (append)                        |
| `2>&1`        | stderr → same place as stdout                 |
| `1>&2`        | stdout → same place as stderr                 |
| `&> file`     | stdout + stderr → file (overwrite)            |
| `&>> file`    | stdout + stderr → file (append)               |
| `/dev/null`   | discard output entirely                       |
| `<< EOF`      | heredoc — multi-line stdin                    |
| `<<< "str"`   | here-string — single-line stdin               |
| `\|`          | pipe stdout of one command into another       |
| `tee file`    | duplicate output to file **and** screen       |
| `<(cmd)`      | process substitution — treat command output as a readable file |
| `exec 3> file`| open a custom file descriptor                 |

---

## 12. Real-World Combined Example

A backup script that logs everything, separates warnings from real errors, and shows progress live:

```bash
#!/bin/bash

LOG_FILE="/var/log/backup.log"
ERROR_FILE="/var/log/backup_errors.log"

{
    echo "=== Backup started: $(date) ==="
    tar -czf /backup/data_$(date +%F).tar.gz /home/user/data 2>> "$ERROR_FILE"
    echo "=== Backup finished: $(date) ==="
} | tee -a "$LOG_FILE"

if [[ -s "$ERROR_FILE" ]]; then
    echo "Backup completed with errors — check $ERROR_FILE" 1>&2
fi
```

What's happening:
- `{ ... }` groups commands so their combined stdout can be piped once
- `tee -a` shows progress on screen **and** appends to the main log
- `2>>` sends only tar's errors to a separate error file, so real problems aren't buried in routine output
- `1>&2` correctly flags the final warning as an error message, not normal output
- `[[ -s "$ERROR_FILE" ]]` checks if the error file has any content (size greater than 0)

This single script demonstrates six different redirection concepts working together — which is exactly how they show up in real automation.