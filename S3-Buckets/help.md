# S3 Bucket Creation Script

This document provides details about a shell script for creating an S3 bucket using the AWS CLI. The script allows you to specify the bucket name, region, and optional public access settings.

## Script Overview

The script performs the following tasks:

1. Prompts the user for the S3 bucket name and region.
2. Creates the S3 bucket with the specified parameters.
3. Optionally sets a public read access policy for the bucket.

### Shell Script

You can go to creation.sh to see 

[creation.sh ] (https://github.com/adeelabbas1214/aws-cli-shell-scripting/blob/main/S3-Buckets/creation.sh)


# How to Use the Script
Save the Script: Copy the script into a file named create_s3_bucket.sh.

Make it Executable: Run the following command to make the script executable:

bash
Copy code
```
chmod +x create_s3_bucket.sh
```
Run the Script: Execute the script:

bash
Copy code
```
./create_s3_bucket.sh
```
# Notes
AWS CLI Configuration: Ensure that your AWS CLI is configured with access keys that have permissions to create S3 buckets.

Bucket Name: The bucket name must be globally unique across all existing bucket names in Amazon S3. You may encounter an error if the name is already in use.

Region: If you don’t provide a region, it defaults to us-east-1. You can specify a different region as needed.

Public Access: The script provides an option to set public read access. Modify the bucket policy as needed for your requirements. Be cautious when granting public access to ensure sensitive data is not exposed.

Error Handling: The script checks for successful bucket creation and exits if it fails, providing feedback on the operation's success.




