#!/bin/bash

#Create the cluster
./create_cluster.sh
#Create the nginx ingress
./nginx-controller.sh
#Create namespaces
./create-namespaces.sh
