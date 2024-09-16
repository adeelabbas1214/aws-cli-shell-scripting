# S3 Bucket Creation Script

This script automates the process of creating an Amazon S3 bucket, granting it public access, and then blocking public access. It uses the AWS CLI to interact with S3.

## Prerequisites

Before using the script, ensure that:

1. **AWS CLI** is installed and configured. You can install the AWS CLI by following the official documentation: [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html).
   
   You must configure your AWS credentials before running the script:
   ```bash
   aws configure


### Permissions

The AWS IAM user/role running this script must have permissions for:

- `s3:CreateBucket`
- `s3:PutBucketAcl`
- `s3:PutPublicAccessBlock`
- `s3:GetBucketAcl`
- `s3:GetPublicAccessBlock`



# Script Overview

The `create_s3_bucket.sh` script performs the following actions:

1. **Creates an S3 bucket in a specified region.**
2. **Grants public-read access** to the S3 bucket.
3. **Blocks public access** to the S3 bucket using S3's public access block settings.


# Usage

## Step 1: Make the Script Executable

After downloading or creating the script, make it executable by running:

```bash
chmod +x create_s3_bucket.sh
