#!/bin/bash
##########################################
#PROJECT_ID was used to create the project within Google Cloud Platform
export PROJECT_ID="mstakx-k8s-assessment"
#CLUSTER_NAME was used in the creation of the cluster, this is the name that is set on the Kubernetes Engine page.
export CLUSTER_NAME="mstakx"
#REGION was used in the creation of the cluster, this property set the closest region for the United Kingdom in this case "europe-west2".
export REGION="europe-west2"

#########################################

echo "Deleting the cluster created earlier"
gcloud config set project $PROJECT_ID
gcloud config set compute/zone $REGION
gcloud container clusters delete $CLUSTER_NAME --quiet


echo "Deleting the project created earlier"
gcloud projects delete $PROJECT_ID --quiet
