#!/bin/bash
#export PROJECT_ID=mstakx-k8s-assessment

echo -e "\nCreate a project within GKE"
gcloud projects create $PROJECT_ID --name "K8s Assesment for DevOps Role"

echo -e "\nConfiguring default settings for gcloud"
#Set the project
gcloud config set project $PROJECT_ID

echo -e "\nEnabling billing"
#Getting the Billing account to link with the project id in order to enable use GServices
BILLING_ACCOUNT=$(gcloud alpha billing accounts list --format text | grep name | awk {'print $2'} | awk -F "/" {'print $2'})

gcloud beta billing projects link $PROJECT_ID --billing-account=$BILLING_ACCOUNT 

echo -e "\nWaiting while Kubernetes engine gets ready, this may take a while... (up to 2 minutes)"
sleep 130

echo -e "\nEnabling Containers API"
gcloud services enable container.googleapis.com
sleep 30

echo -e "\nProject $PROJECT_ID should be ready to use Google Kubernetes Engine, please verify with following link: https://console.cloud.google.com/kubernetes/ and select the newly created project "$PROJECT_ID"" 
echo -e "\nIf there's a message about "Kubernetes Engine is getting ready", please wait until the process finishes up and then press ENTER"
read ENTER

