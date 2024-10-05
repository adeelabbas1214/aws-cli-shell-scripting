#!/bin/bash

# Set bucket name
BUCKET_NAME="your-bucket-name"

# Enable public read access to the bucket (bucket ACL)
aws s3api put-bucket-acl --bucket $BUCKET_NAME --acl public-read

# Set bucket policy for public read access
aws s3api put-bucket-policy --bucket $BUCKET_NAME --policy '{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "PublicReadGetObject",
      "Effect": "Allow",
      "Principal": "*",
      "Action": "s3:GetObject",
      "Resource": "arn:aws:s3:::'"$BUCKET_NAME"'/*"
    }
  ]
}'
