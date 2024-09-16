# Creating an EC2 Instance Using Shell Script

This document provides a step-by-step guide on how to create an EC2 instance using a shell script and the AWS CLI.

## Prerequisites

1. **AWS CLI**: Ensure that you have the AWS CLI installed and configured on your machine. You can install it from [AWS CLI Installation](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).

2. **AWS Credentials**: Configure your AWS credentials using the `aws configure` command. Ensure you have the necessary permissions to create EC2 instances.

## Shell Script

The following script (`create_ec2_instance.sh`) will create an EC2 instance with specified parameters.

### Script Explanation

```bash
#!/bin/bash

# Variables
INSTANCE_TYPE="t2.micro" # EC2 instance type
KEY_NAME="your-key-name" # Name of your key pair
SECURITY_GROUP="your-security-group" # Security group name
AMI_ID="ami-xxxxxxxx" # Replace with your desired AMI ID
REGION="us-east-1"  # AWS region
TAG_NAME="MyEC2Instance" # Name tag for the instance

# Create the EC2 instance
INSTANCE_ID=$(aws ec2 run-instances \
  --image-id $AMI_ID \
  --instance-type $INSTANCE_TYPE \
  --key-name $KEY_NAME \
  --security-groups $SECURITY_GROUP \
  --region $REGION \
  --query 'Instances[0].InstanceId' \
  --output text)

# Tag the EC2 instance
aws ec2 create-tags \
  --resources $INSTANCE_ID \
  --tags Key=Name,Value=$TAG_NAME \
  --region $REGION

echo "EC2 Instance created with ID: $INSTANCE_ID"

```

## Instructions

1. **Edit the Script**: Replace placeholders (e.g., `your-key-name`, `your-security-group`, `ami-xxxxxxxx`) with your actual values.

2. **Make the Script Executable**:

   ```bash
   chmod +x create_ec2_instance.sh

   ```


   ``` bash

   ./create_ec2_instance.sh

