#!/bin/bash
echo "Deleting the cluster created earlier"
REGION="europe-west2"
gcloud config set compute/zone $REGION
gcloud container clusters delete mstakx --quiet

echo "Deleting the project created earlier"
gcloud projects delete mstakx-k8s-assessment --quiet
