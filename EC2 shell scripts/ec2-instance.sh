#!/bin/bash

# Variables
INSTANCE_TYPE="t2.micro"
KEY_NAME="your-key-name"
SECURITY_GROUP="your-security-group"
AMI_ID="ami-xxxxxxxx" # Replace with your desired AMI ID
REGION="us-east-1"  # Replace with your desired AWS region
TAG_NAME="MyEC2Instance"

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
