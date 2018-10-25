#!/bin/bash
#Command executed in each frontend pod
#Running from within the pod it could reach almost its limit 150mi

#Previous command to perform a CPU load test
#while $I<10000; do curl localhost > /dev/null; sleep 0.08; I=(($I+1)); echo $I; done

#Previous command to perform a CPU load test using a counter
#while [ $I -lt 2000 ]; do curl http://guestbook.mstakx.io > /dev/null; sleep 0.08; I=$(($I+1)); echo $I; done

LOAD="dd if=/dev/zero of=/dev/null bs=100M count=1000"

