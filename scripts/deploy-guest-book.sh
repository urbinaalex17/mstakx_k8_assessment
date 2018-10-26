#!/bin/bash
YAML_DIR="../yaml"
STAGING_DIR=$YAML_DIR/staging
PRODUCTION_DIR=$YAML_DIR/production
STAGING_FILE=$STAGING_DIR/guestbook-staging.yaml
PRODUCTION_FILE=$PRODUCTION_DIR/guestbook-production.yaml
HPA_PRODUCTION_FILE=$YAML_DIR/production-hpa.yaml
HPA_STAGING_FILE=$YAML_DIR/staging-hpa.yaml

echo -e "\nDeploying Guest-book application on staging namespace"
kubectl create -f $STAGING_FILE

echo -e "\nDeploying Guest-book application on production namespace"
kubectl create -f $PRODUCTION_FILE

echo -e "\nGathering information about the environments"
sleep 50
INGRESS_CONTROLLER_IP=$(kubectl -n ingress-nginx get svc | awk {'print $4'} | grep [0-9])

echo -e "\nUpdate your host file as follow:"
echo -e "\nFor Production:"
echo "$INGRESS_CONTROLLER_IP guestbook.mstakx.io"

echo -e "\nFor Staging:"
echo "$INGRESS_CONTROLLER_IP staging-guestbook.mstakx.io"

echo -e "\nCreating Horizontal Pod AutoScaler on both namespaces"
kubectl create -f $HPA_PRODUCTION_FILE
kubectl create -f $HPA_STAGING_FILE

sleep 25
