#!/bin/bash
ENV=$1
if [ -z "$ENV" ]; then echo "Usage: $0 <env>"; exit 1; fi
SERVICE="my-${ENV}-service"
REGION="us-central1"

URL=$(gcloud run services describe $SERVICE --region=$REGION --platform=managed --format='value(status.url)')
if [ -z "$URL" ]; then echo "Failed to retrieve service URL"; exit 2; fi
echo "Service URL: $URL"
