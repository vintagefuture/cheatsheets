#!/bin/bash

export PROFILE=
export CLUSTER=
export SERVICE=
export REGION=
export STATUS=
export CONTAINER_NAME=

show_usage() {
  echo "Usage: $0 <stack_name>" 1>&2
  exit 1
}

startService() {
        aws ecs update-service \
            --profile $PROFILE \
            --cluster $CLUSTER \
            --desired-count 1 \
            --service $SERVICE \
            --enable-execute-command \
            --force-new-deployment
}


if [ $# -ne 1 ]; then
  show_usage
else
  startService "$1"
fi
