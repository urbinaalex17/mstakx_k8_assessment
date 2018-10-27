---------------------------------------------------------------------------------------

PRE-REQUISITES

All the scripts were designed to be executed from within the Google Cloud Shell
https://console.cloud.google.com/cloudshell/

Once there, you can clone the entire repository as follow:
git clone https://github.com/urbinaalex17/mstakx_k8_assessment.git

It's important to have at least one Billing Acount activated, otherwise all the proccess will fail.
Check this out with the link below:
https://console.cloud.google.com/billing

---------------------------------------------------------------------------------------

CUSTOMIZING THE PROJECT'S NAME, CLUSTER'S NAME AND REGION

Please update the following variables in the all-steps.sh script prior to its execution, otherwise the creation is likely to fail due to Google maintains unique project IDs.

Variable used to create a project within Google Cloud Platform
PROJECT_ID="mstakx-k8s-assessment"

Variable used in the creation of the cluster, this is the cluster's name that will be set on the Kubernetes Engine page. https://console.cloud.google.com/kubernetes
CLUSTER_NAME="mstakx"

Variable used in the creation of the cluster, this property will set the closest region for the United Kingdom in this case europe-west2. Please refer to https://cloud.google.com/compute/docs/regions-zones/#available for further information.
REGION="europe-west2"


---------------------------------------------------------------------------------------

CPU LOAD TEST

If the creation of the project and cluster went right, you will need to open up 3 terminal sessions more. Make sure to disable Tmux integration, for further information please refere to https://cloud.google.com/shell/docs/features#tmux_support


---------------------------------------------------------------------------------------

DNS SETTINGS

The script will tell you the proper entries you need to create in your hosts file in order to reach staging-guestbook.mstakx.io and guestbook.mstakx.io pages.


---------------------------------------------------------------------------------------

USING THE WRAPPER SCRIPT


Once you had been checked out the previous sections, now you are able to execute the all-steps.sh script in the scripts folder as follow:

cd mstakx_k8_assessment/scripts
./all-steps.sh

---------------------------------------------------------------------------------------

