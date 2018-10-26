#!/bin/bash
#Command executed in each frontend pod
#Running from within the pod it could reach almost its limit 150mi

#Previous command to perform a CPU load test
#while $I<10000; do curl localhost > /dev/null; sleep 0.08; I=(($I+1)); echo $I; done

#Previous command to perform a CPU load test using a counter
#while [ $I -lt 2000 ]; do curl http://guestbook.mstakx.io > /dev/null; sleep 0.08; I=$(($I+1)); echo $I; done

LOAD="dd if=/dev/zero of=/dev/null bs=100M count=1000"

echo -e "\n\nGathering information about Horizontal Pod Autoscalers"
sleep 15

echo -e "Horizontal Pod Autoscaler for Staging namespace"
kubectl -n staging get hpa

echo -e "Horizontal Pod Autoscaler for Production namespace"
kubectl -n production get hpa


echo -e "\nCPU Load test"
echo -e "In order to perform this CPU load test, please open up 3 terminal sessions in your Google Cloud Shell Environment and execute \
         the following command in each terminal session"
FRONTS=$(kubectl -n production get pods -l app=guestbook | grep front | awk {'print $1'})
for frontend in $FRONTS
do
  i=1
  echo -e "\nExecute this in Terminal $i"
  echo -e "kubectl -n production exec -ti $frontend -- \$LOAD"
  sleep 10
done

#kubectl -n production get pods -l app=guestbook
