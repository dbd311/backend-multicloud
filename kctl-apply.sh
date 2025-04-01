#!/bin/bash

# Create the namespace if it doesn't exist
kubectl create namespace multi-cloud --dry-run=client -o yaml | kubectl apply -f -

kubectl apply -f backend-configMap.yaml

kubectl apply -f backend-deployment.yaml

kubectl apply -f backend-service.yaml 