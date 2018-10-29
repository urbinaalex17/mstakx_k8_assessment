#!/bin/bash
##########################################
#It read the variables from the config file
source mstakx.config

export PROJECT_ID
export CLUSTER_NAME
export REGION

#########################################

echo "Deleting the cluster created earlier"
gcloud config set project $PROJECT_ID
gcloud config set compute/zone $REGION
gcloud container clusters delete $CLUSTER_NAME --quiet


echo "Deleting the project created earlier"
gcloud projects delete $PROJECT_ID --quiet
