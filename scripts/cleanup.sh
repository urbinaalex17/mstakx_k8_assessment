#!/bin/bash
echo "Deleting the cluster created earlier"
gcloud container clusters delete mstakx --quiet

echo "Deleting the project created earlier"
gcloud projects delete mstakx-k8-assessment --quiet
