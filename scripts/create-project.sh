#!/bin/bash
export PROJECT_ID=mstakx-k8s-assessment

echo "Create a project within GKE"
gcloud projects create $PROJECT_ID --name "K8s Assesment for DevOps Role"

echo "Configuring default settings for gcloud"
#Set the project
gcloud config set project $PROJECT_ID

echo "Enabling billing"
#Getting the Billing account to link with the project id in order to enable use GServices
export BILLING_ACCOUNT=$(gcloud alpha billing accounts list --format text | grep name | awk {'print $2'} | awk -F "/" {'print $2'})

gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT 

echo -e "\nWaiting while Kubernetes engine gets ready, this may take a while..."
sleep 130

echo -e "Project $PROJECT_ID is ready to user the Kubernetes engine"

