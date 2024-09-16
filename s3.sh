#!/bin/bash

# Variables
BUCKET_NAME=$1  # Take bucket name as the first argument
REGION="us-east-1"  # You can change the region if required

# Check if bucket name is provided
if [ -z "$BUCKET_NAME" ]; then
  echo "Error: Bucket name not provided."
  echo "Usage: ./create_s3_bucket.sh <bucket-name>"
  exit 1
fi

# Create an S3 bucket
echo "Creating S3 bucket: $BUCKET_NAME"
aws s3api create-bucket --bucket "$BUCKET_NAME" --region "$REGION" --create-bucket-configuration LocationConstraint="$REGION"

# Set public access (public-read ACL)
echo "Granting public-read access to the bucket..."
aws s3api put-bucket-acl --bucket "$BUCKET_NAME" --acl public-read

# Verify public access
echo "Verifying public access for $BUCKET_NAME..."
aws s3api get-bucket-acl --bucket "$BUCKET_NAME"

# Block public access (optional, if you need to block later)
echo "Blocking public access to the bucket..."
aws s3api put-public-access-block --bucket "$BUCKET_NAME" --public-access-block-configuration BlockPublicAcls=true IgnorePublicAcls=true BlockPublicPolicy=true RestrictPublicBuckets=true

# Verify public access block settings
echo "Verifying public access block settings..."
aws s3api get-public-access-block --bucket "$BUCKET_NAME"

echo "S3 bucket $BUCKET_NAME created with public access, then blocked successfully."
