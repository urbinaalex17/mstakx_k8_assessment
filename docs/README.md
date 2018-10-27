
## What was the node size chosen for the kubernetes nodes? And why?

The node size was chosen based upon the number of pods that will be running on the cluster, 12 in Normal Load and 16 in Heavy Load.
There are sufficient resources available in the cluster to run the application in both namespaces at the same time.
OS memory/cpu utilization, as well as cluster services were taken into consideration during the cluster design.


Node   | CPU  | Memory | Availability Zone
-------| ---- | ------ | ----------------
Node 1 | 2 | 3.75GB | europe-west2-a 
Node 2 | 2 | 3.75GB | europe-west2-b 
Node 3 | 2 | 3.75GB | europe-west2-c 


Please refer to [mStakx Cluster Desing](mStack-cluster-cpu-memory-desing.xlsx) for further information 

## What method was chosen to install the demo application and ingress controller on the cluster, justify the method used



## What would be your chosen solution to monitor the application on the cluster and why?

## What additional components / plugins would you install on the cluster to manage it better?