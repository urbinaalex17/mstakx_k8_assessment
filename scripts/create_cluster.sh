#!/bin/bash
export PROJECT_ID=mstakx-k8-assessment

echo "Create a project within GKE"
gcloud projects create $PROJECT_ID --name "K8s Assesment for DevOps Role"

echo "Configuring default settings for gcloud"
#Set the project
gcloud config set project $PROJECT_ID

#Will use the closest region for the United Kingdom in this case "europe-west2" and the availabily zone "a" 
gcloud config set compute/zone europe-west2-a

echo "Enabling billing"
#Getting the Billing account to link with the project id in order to enable use GServices
export BILLING_ACCOUNT=$(gcloud alpha billing accounts list --format text | grep name | awk {'print $2'} | awk -F "/" {'print $2'})

gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT 

echo "Waiting while Kubernetes engine gets ready, this can take a while..."
sleep 160

echo "Creating a GKE cluster"
CLUSTER_NAME=mstakx
gcloud container clusters create $CLUSTER_NAME

echo "Getting authentication credentials for the cluster"
gcloud container clusters get-credentials $CLUSTER_NAME


