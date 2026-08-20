#!/bin/bash

#function to install awscli

isAwsPresent() {
        if ! command -v aws >& /dev/null; then
                echo "aws Cli Doesn't Present Need To Install"
                return 1
        fi
}

installAWScli() {
        curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
        command -v unzip
        if ! command -v unzip; then
                sudo apt update
                sudo apt install -y unzip
        fi
        unzip awscliv2.zip
        sudo ./aws/install

}

wating_for_Cluster_RunningState() {
        local instanceId="$1"
        echo "InstanceId is $instanceId"
        while true;
        do
                Instance=$(aws ec2 describe-instances --instance-ids "$instanceId")
                InstanceState=$(echo "$Instance" | jq -r '.Reservations[0].Instances[0].State.Name')
                echo "$InstanceState"
                if [[ "$InstanceState" == "running" ]]; then
                        echo "Your Instance is now running"
                        break
                fi
                sleep 5
        done
}

create_ec2() {

        local imageId="$1"
        local instanceType="$2"
        local keyName="$3"
        local securityGroupId="$4"
        local subnetId="$5"
        local instanceName="$6"

        echo "$imageId"

        instance=$(aws ec2 run-instances \
        --image-id "$imageId" \
        --count 1  \
        --instance-type "$instanceType" \
        --key-name "$keyName" \
        --security-group-ids "$securityGroupId" \
        --subnet-id "$subnetId" \
        --tag-specifications "ResourceType=instance,Tags=[{Key=Name,Value=$instanceName}]" \
#       --query 'Instances[0].InstanceId' \
                )


        echo "The instance id is , $(echo "$instance" | jq -r '.Instances[0].InstanceId')"
        echo "Instance launch successfull"
#       wating_for_Cluster_RunningState "$(echo "$instance" | jq -r '.Instances[0].InstanceId')"
        aws ec2 wait instance-running --instance-ids "$(echo "$instance" | jq -r '.Instances[0].InstanceId')"
        echo "Your Instance is now running"

}

if isAwsPresent; then
        echo "aws Cli Already Present Not need to Install "
else
        if !installAWScli ; then
                exit 1
        else
                echo "aws cli installed sccessfully"
        fi
fi

callcreateEc2() {

        imageId="ami-0e5497a77ef21b5ac"
        instanceType="t3.micro"
        keyName="Cli-Key-pair"
        securityGroupId="sg-0daf42b81817a520b"
        subnetId="subnet-0491a8d96c1ecbd7b"
        instanceName="EC2-Make-By-cli-$1"

        create_ec2 "$imageId" "$instanceType" "$keyName" "$securityGroupId" "$subnetId" "$instanceName"

}

callcreateEc2 $1