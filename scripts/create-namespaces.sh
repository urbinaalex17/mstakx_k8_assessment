#!/bin/bash
YAML_DIR=$PWD/../yaml
YAML_FILE=$YAML_DIR/staging-production-namespaces.yaml

echo -e "\n\nCreating the staging and production namespaces"
kubectl apply -f $YAML_FILE 
