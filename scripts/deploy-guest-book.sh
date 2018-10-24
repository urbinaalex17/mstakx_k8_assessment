#!/bin/bash
YAML_DIR="../yaml"
STAGING_DIR=$YAML_DIR/staging
PRODUCTION_DIR=$YAML_DIR/production
STAGING_FILE=$STAGING_DIR/guestbook-staging.yaml
PRODUCTION_FILE=$PRODUCTION_DIR/guestbook-production.yaml

echo -e "\nDeploying Guest-book application on staging namespace"
kubectl apply -f $STAGING_FILE

echo -e "\nDeploying Guest-book application on production namespace"
kubectl apply -f $PRODUCTION_FILE

echo -e "\nGathering information about the environments"

INGRESS_CONTROLLER_IP=$(kubectl -n ingress-nginx get svc | awk {'print $4'} | grep [0-9])

echo -e "\nUpdate your host file as follow:"
echo -e "\nFor Production:"
echo "$INGRESS_CONTROLLER_IP guestbook.mstakx.io"

echo -e "\nFor Staging:"
echo "$INGRESS_CONTROLLER_IP staging-guestbook.mstakx.io"
