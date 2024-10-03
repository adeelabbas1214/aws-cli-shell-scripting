#!/bin/bash

# Prompt for bucket name and region
read -p "Enter the S3 bucket name: " BUCKET_NAME
read -p "Enter the AWS region (default: us-east-1): " REGION

# Set default region if not provided
REGION=${REGION:-us-east-1}

# Create the S3 bucket
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"

# Check if the bucket was created successfully
if [ $? -eq 0 ]; then
    echo "Bucket '$BUCKET_NAME' created successfully in region '$REGION'."
else
    echo "Failed to create bucket '$BUCKET_NAME'."
    exit 1
fi

# Optional: Set bucket policy (example policy to allow public read access)
read -p "Do you want to set public read access? (y/n): " PUBLIC_ACCESS
if [[ "$PUBLIC_ACCESS" == "y" ]]; then
    # Define the bucket policy
    BUCKET_POLICY='{
        "Version": "2012-10-17",
        "Statement": [
            {
                "Effect": "Allow",
                "Principal": "*",
                "Action": "s3:GetObject",
                "Resource": "arn:aws:s3:::'"$BUCKET_NAME"'/*"
            }
        ]
    }'

    # Set the bucket policy
    aws s3api put-bucket-policy --bucket "$BUCKET_NAME" --policy "$BUCKET_POLICY"
    echo "Public read access granted for bucket '$BUCKET_NAME'."
else
    echo "No public access granted for bucket '$BUCKET_NAME'."
fi

echo "S3 bucket setup complete!"
