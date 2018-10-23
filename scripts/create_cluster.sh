#!/bin/bash
export PROJECT_ID=mstakx-k8-assessment

echo "Create a project within GKE"
gcloud projects create $PROJECT_ID --name "K8s Assesment for DevOps Role"

echo "Configuring default settings for gcloud"
#Set the project
gcloud config set project $PROJECT_ID

#Will use the closest region for the United Kingdom in this case "europe-west2" and the availabily zone "a" 
gcloud config set compute/zone europe-west2-a

#Enabling billing
#Getting the Project Number and account to update the property into the policy_template.json file and generate a clear policy.json file
export PROJECT_NUMBER=$(gcloud projects describe $PROJECT_ID --format text | grep projectNumber | awk '{print $2}')
export ACCOUNT=$(gcloud config get-value account -q)

#Making a copy of policy_template to replace default parameters
cp -f templates/policy_template.json templates/policy.json
sed -i -e "s/w.alexanderuc@gmail.com/$ACCOUNT/g" templates/policy.json
sed -i -e "s/304966747568/$PROJECT_NUMBER/g" templates/policy.json

#Applying the policy to the project
gcloud projects set-iam-policy $PROJECT_ID policy.json --quiet

echo "Creating a GKE cluster"
CLUSTER_NAME=mstakx
gcloud container clusters create $CLUSTER_NAME

echo "Getting authentication credentials for the cluster"
gcloud container clusters get-credentials $CLUSTER_NAME


