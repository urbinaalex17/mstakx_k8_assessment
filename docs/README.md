
## What was the node size chosen for the kubernetes nodes? And why?

The node size was chosen based upon the number of pods that will be running on the cluster, 12 in Normal Load and 16 in Heavy Load.
There are sufficient resources available in the cluster to run the application in both namespaces at the same time.
OS memory/cpu utilization, as well as cluster services were taken into consideration during the cluster design.


Node   | CPU  | Memory | Availability Zone
-------| ---- | ------ | ----------------
Node 1 | 2 | 3.75GB | europe-west2-a 
Node 2 | 2 | 3.75GB | europe-west2-b 
Node 3 | 2 | 3.75GB | europe-west2-c 

Multi-AZ was enabled in the cluster design, thus, it can cope with a node failure, whether an OS or an Availability Zone disaster.

The region chosen was europe-west2 due to the fact that it is the closest region for The United Kingdom

Please refer to [mStakx Cluster Desing](mStack-cluster-cpu-memory-desing.xlsx) for further information 

## What method was chosen to install the demo application and ingress controller on the cluster, justify the method used

Both the application and ingress controller are installed via YAML files as pods. It is the easiest way to install the ingress controller. Due to the fact that there is no special configuration related to ingress controller <--> application.

## What would be your chosen solution to monitor the application on the cluster and why?

[Strackdriver](https://app.google.stackdriver.com), due to the fact that it has native integration with Google Cloud Platform, the process to enable and create dashboards with custom metric is relatively easy.

## What additional components / plugins would you install on the cluster to manage it better?


