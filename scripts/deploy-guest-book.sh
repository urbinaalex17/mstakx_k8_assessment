#!/bin/bash
YAML_DIR="../yaml"
STAGING_DIR=$YAML_DIR/staging
STAGING_REDIS_MASTER_FILE=$STAGING_DIR/redis-master-deployment-staging.yaml

kubectl apply -f $STAGING_REDIS_MASTER_FILE

