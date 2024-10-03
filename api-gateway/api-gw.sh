#!/bin/bash

# Set variables
API_NAME="MyAPI"
STAGE_NAME="dev"
REGION="us-east-1"  # Change to your preferred region

# Create the API Gateway
API_ID=$(aws apigateway create-rest-api --name "$API_NAME" --region "$REGION" --query 'id' --output text)
echo "Created API Gateway with ID: $API_ID"

# Get the root resource ID
ROOT_RESOURCE_ID=$(aws apigateway get-resources --rest-api-id "$API_ID" --region "$REGION" --query 'items[?path==`/`].id' --output text)

# Create a new resource under the root
RESOURCE_NAME="myresource"
RESOURCE_ID=$(aws apigateway create-resource --rest-api-id "$API_ID" --parent-id "$ROOT_RESOURCE_ID" --path-part "$RESOURCE_NAME" --region "$REGION" --query 'id' --output text)
echo "Created resource '$RESOURCE_NAME' with ID: $RESOURCE_ID"

# Create a GET method for the new resource
aws apigateway put-method --rest-api-id "$API_ID" --resource-id "$RESOURCE_ID" --http-method GET --authorization-type NONE --region "$REGION"
echo "Created GET method for resource '$RESOURCE_NAME'"

# Set up a mock integration for the GET method
aws apigateway put-integration --rest-api-id "$API_ID" --resource-id "$RESOURCE_ID" --http-method GET --type MOCK --region "$REGION"
echo "Set up mock integration for GET method"

# Create a method response
aws apigateway put-method-response --rest-api-id "$API_ID" --resource-id "$RESOURCE_ID" --http-method GET --status-code 200 --region "$REGION"
echo "Created method response for GET method"

# Deploy the API
aws apigateway create-deployment --rest-api-id "$API_ID" --stage-name "$STAGE_NAME" --region "$REGION"
echo "Deployed API to stage '$STAGE_NAME'"

echo "API Gateway creation complete!"
