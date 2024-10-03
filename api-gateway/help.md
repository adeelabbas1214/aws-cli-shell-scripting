# How to Use the Script

1. **Save the Script**: Copy the script into a file named `create_api_gateway.sh`.

2. **Make it Executable**: Run the following command to make the script executable:
   ```bash
   chmod +x create_api_gateway.sh


Run the Script: Execute the script:
```
./create_api_gateway.sh
```


# Notes
AWS CLI Configuration: Ensure your AWS CLI is configured with access keys that have permissions to create API Gateway resources.

Region: Update the REGION variable in the script to your desired AWS region.

Mock Integration: The script creates a mock integration for the GET method. 

You can modify the integration settings based on your requirements, such as linking it to a Lambda function or another HTTP endpoint.

API Gateway Limits: Be aware of the limits on API Gateway resources and methods to avoid exceeding them.
