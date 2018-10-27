
# Prerequisites

All the scripts were designed to be executed from within the [Google Cloud Shell](https://console.cloud.google.com/cloudshell)

Once there, you can clone the entire repository as follow:

git clone https://github.com/urbinaalex17/mstakx_k8_assessment.git

It's important to have one [Billing Acount activated](https://console.cloud.google.com/billing), otherwise all the proccess will fail.


## Customizing the project's name, cluster's name and region

Please update the following variables in the all-steps.sh script in the scripts folder prior to its execution, otherwise the creation is likely to fail due to Google maintains unique project IDs.

Variable used to create a project within Google Cloud Platform.
Project IDs must start with a lowercase letter and can have lowercase ASCII letters, digits or hyphens. Project IDs must be between 6 and 30 characters.

PROJECT_ID="mstakx-k8s-assessment"

Variable used in the creation of the cluster, this is the cluster's name that will be set on the [Kubernetes Engine page.](https://console.cloud.google.com/kubernetes)

CLUSTER_NAME="mstakx"

Variable used in the creation of the cluster, this property will set the closest region for the United Kingdom in this case europe-west2. Please refer to [Regions and Zones](https://cloud.google.com/compute/docs/regions-zones/#available) for further information.

REGION="europe-west2"


## CPU Load test for the Horizontal Pod Autoscaler

If the creation of the project and cluster went right, you will need to open up 3 terminal sessions more. Make sure to disable [Tmux integration.](https://cloud.google.com/shell/docs/features#tmux_support)


## DNS Settings

The script will tell you the proper entries you need to create in your hosts file in order to reach staging-guestbook.mstakx.io and guestbook.mstakx.io pages.


## Using the wrapper script

Once you had been checked out the previous sections, now you are able to execute the all-steps.sh script in the scripts folder.


# Documentation

Details are documented in the [DOCS.md](docs/DOCS.md)

