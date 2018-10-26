#!/bin/bash
#Command executed in each frontend pod
#Running from within the pod it could reach almost its limit 150mi

#Previous command to perform a CPU load test
#while $I<10000; do curl localhost > /dev/null; sleep 0.08; I=(($I+1)); echo $I; done

#Previous command to perform a CPU load test using a counter
#while [ $I -lt 2000 ]; do curl http://guestbook.mstakx.io > /dev/null; sleep 0.08; I=$(($I+1)); echo $I; done

#Variable use in frontend deployment 
#LOAD="dd if=/dev/zero of=/dev/null bs=100M count=1000"

echo -e "\n\nGathering information about Horizontal Pod Autoscalers"

echo -e "Horizontal Pod Autoscaler for Staging namespace"
kubectl -n staging get hpa

echo -e "Horizontal Pod Autoscaler for Production namespace"
kubectl -n production get hpa


echo -e "\nCPU Load test"
echo -e "In order to perform this CPU load test, please open up 3 terminal sessions in your Google Cloud Shell Environment and execute the following command in each terminal session"

echo -e "\nPlease specify the namespace to perform the testi, followed by [ENTER]"
read NAMESPACE
export $NAMESPACE

#Gathering the list of running pods
FRONTS=$(kubectl -n $NAMESPACE get pods -l app=guestbook | grep front | awk {'print $1'})
for frontend in $FRONTS
do
  echo -e "\nExecute the following command in another terminal session"
  echo "kubectl -n $NAMESPACE exec -ti $frontend -- /bin/sh -c \\\$LOAD"
done

./monitoring.sh
