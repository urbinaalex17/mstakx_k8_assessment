#!/bin/bash
#This wrapper script will execute all the steps from creating a project into Google Cloud Platform to performing a CPU Load 
#and monitoring the frontend deployment which has 3 replicas and a maximum pod of 5

#########################################
#It read the variables from the config file
source mstakx.config
export PROJECT_ID
export CLUSTER_NAME
export REGION
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

echo -e "\n\nTo clean up execute the cleanup.sh script"
