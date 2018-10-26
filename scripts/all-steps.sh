#!/bin/bash

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
