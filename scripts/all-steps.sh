#!/bin/bash
#This wrapper script will execute all the steps from creating a project into Google Cloud Platform to performing a CPU Load 
#and monitoring the frontend deployment which has 3 replicas and a maximum pod of 5

##########################################
#VARIABLES
#The following variables are used throughout the creation of the project and all resources related with the Kubernetes Cluster
#Feel free to change it if you want to customize any name
#Keep in mind that you must change this variables in the cleanup.sh script, to match the parameters.
#
##########################################
#PROJECT_ID is used to create a project within Google Cloud Platform
#Project IDs must start with a lowercase letter and can have lowercase ASCII letters, digits or hyphens. Project IDs must be between 6 and 30 characters.
export PROJECT_ID="mstakx-k8s-assessment"
#CLUSTER_NAME is used in the creation of the cluster, this is the name that will be set on the Kubernetes Engine page.
export CLUSTER_NAME="mstakx"
#REGION is used in the creation of the cluster, this property will set the closest region for the United Kingdom in this case "europe-west2".
export REGION="europe-west2"

#########################################

#Create the project
./create-project.sh
#Create the cluster
./create-cluster.sh
#Create the nginx ingress
./nginx-controller.sh
#Create namespaces
./create-namespaces.sh
#Deploy app
./deploy-guest-book.sh
#CPU Load
./cpu-load.sh

echo -e "\n\nTo clean up execute the cleanup.sh script, remember to update the variables."
