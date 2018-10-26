#!/bin/bash
#Variable use in frontend deployment 
#LOAD="dd if=/dev/zero of=/dev/null bs=100M count=1000"

echo -e "\n\nCPU Load test:"
echo -e "In order to perform this CPU load test, please open up 3 terminal sessions in your Google Cloud Shell Environment and execute the following command in each terminal session"
sleep 5

echo -e "\nPlease specify the namespace where you want to perform the test followed by [ENTER]: production|staging"
read NAMESPACE
export NAMESPACE

#Gathering the list of running pods
FRONTS=$(kubectl -n $NAMESPACE get pods -l app=guestbook | grep front | awk {'print $1'})
for frontend in $FRONTS
do
  echo -e "\nExecute the following command in another terminal session"
  echo "kubectl -n $NAMESPACE exec -ti $frontend -- /bin/sh -c \\\$LOAD"
done

./monitoring-load.sh
