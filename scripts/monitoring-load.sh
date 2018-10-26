#!/bin/bash
#This script will demonstrate how the pods are scaling up and down by increasing/decreasing load on existing pods
echo -e "\n\nList of the pods in execution:\n"
kubectl -n $NAMESPACE get pods -l app=guestbook
CURRENT_REPLICAS=$(kubectl -n $NAMESPACE get pods -l app=guestbook | grep front | wc -l)
CHANGE_COUNTER=0
CHANGE_STATE=$CURRENT_REPLICAS

while true
do
  CURRENT_REPLICAS=$(kubectl -n $NAMESPACE get pods -l app=guestbook | grep front | wc -l)
  if [ $CHANGE_STATE != $CURRENT_REPLICAS ]
  then
    CHANGE_STATE=$CURRENT_REPLICAS
    CHANGE_COUNTER=$(($CHANGE_COUNTER+1))
    if [ $CHANGE_COUNTER -eq 2 ]
    then
      echo -e "\nScaling down the frontend deployment:\n"
      kubectl -n $NAMESPACE get pods -l app=guestbook
      exit
    fi
  fi
  if [ $CURRENT_REPLICAS -gt 3 ]
  then
    echo -e "\nScaling up the frontend deployment:\n"
    kubectl -n $NAMESPACE get pods -l app=guestbook
    sleep 360
  fi
  sleep 10 
done
