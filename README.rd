mstakx_k8_assessment

CREATE A K8S CLUSTER ON GCP


Create the cluster using Google Cloud Shell in the Google Cloud Platform

1. Create a project within GKE using Google Cloud Shell
gcloud projects create mstakx-k8-assessment --name "K8s Assesment for DevOps Role"


2. Configuring default settings for gcloud

Set the project:
gcloud config set project mstakx-k8-assessment

Setting up a env variable: 
export PROJECT_ID="$(gcloud config get-value project -q)"


Will use the closest region for the United Kingdom in this case "europe-west2" and the availabily zone "a" :
gcloud config set compute/zone europe-west2-a


3. Creating a GKE cluster
gcloud container clusters create mstakx


4. Get authentication credentials for the cluster
gcloud container clusters get-credentials mstakx



