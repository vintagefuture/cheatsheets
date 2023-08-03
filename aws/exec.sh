#!/bin/bash

export PROFILE=
export CLUSTER=
export SERVICE=
export REGION=
export STATUS=
export CONTAINER_NAME=

# aws ecs update-service \
#     --profile $PROFILE \
#     --cluster $CLUSTER \
#     --desired-count 1 \
#     --service $SERVICE \
#     --enable-execute-command \
#     --force-new-deployment

task_id=$(aws ecs list-tasks \
            --profile $PROFILE \
            --cluster $CLUSTER \
            --service-name $SERVICE \
            --region $REGION \
            --desired-status $STATUS \
            --output json \
            | jq -r '.taskArns[]' | cut -d/ -f3)

aws ecs execute-command \
    --profile $PROFILE \
    --region $REGION \
    --cluster $CLUSTER \
    --task "$task_id" \
    --container $CONTAINER_NAME \
    --interactive \
    --command /bin/bash
