#!/bin/bash
export PROJECT_ID=mstakx-k8s-assessment

echo -e "\nCreating a GKE cluster"
CLUSTER_NAME=mstakx

#Deprecated command to create the cluster
#gcloud container clusters create $CLUSTER_NAME

#It creates a 3 nodes cluster Multi-AZ with 2vCPU and 3.75G RAM each node, it can cope a one node failure, whether an OS failure or an availability zone failure.
#The region chosen is "Europe-west2" due to the fact that it is the closest region for The United Kingdom

#It will use the closest region for the United Kingdom in this case "europe-west2".
REGION="europe-west2"
gcloud config set compute/zone $REGION
 
gcloud beta container --project "$PROJECT_ID" clusters create "$CLUSTER_NAME" --region "$REGION" --username "admin" --cluster-version "1.9.7-gke.6" --machine-type "custom-2-3840" --image-type "COS" --disk-type "pd-standard" --disk-size "100" --scopes "https://www.googleapis.com/auth/compute","https://www.googleapis.com/auth/devstorage.read_only","https://www.googleapis.com/auth/logging.write","https://www.googleapis.com/auth/monitoring","https://www.googleapis.com/auth/servicecontrol","https://www.googleapis.com/auth/service.management.readonly","https://www.googleapis.com/auth/trace.append" --num-nodes "1" --enable-cloud-logging --enable-cloud-monitoring --network "projects/mstakx-k8s-assessment/global/networks/default" --subnetwork "projects/mstakx-k8s-assessment/regions/europe-west2/subnetworks/default" --addons HorizontalPodAutoscaling,HttpLoadBalancing,KubernetesDashboard --enable-autoupgrade --enable-autorepair

echo "Getting authentication credentials for the cluster"
gcloud container clusters get-credentials $CLUSTER_NAME

