#!/bin/bash
YAML_DIR="../yaml"
GUESTBOOK_INGRESS_FILE=$YAML_DIR/guestbook-ingress-rules.yaml

kubectl apply -f $GUESTBOOK_INGRESS_FILE

