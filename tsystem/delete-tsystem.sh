#!/bin/bash

# Scale StatefulSets down to 1 replica
sudo kubectl scale statefulsets tsystem-api --replicas=1
sudo kubectl scale statefulsets tsystem-cache --replicas=1

# Delete StatefulSets
sudo kubectl delete -f ./tsystem-api.yaml
sudo kubectl delete -f ./tsystem-cache.yaml

# Delete Deployment
sudo kubectl delete -f ./tsystem-ui.yaml

# Delete Services
sudo kubectl delete service tsystem-api
sudo kubectl delete service tsystem-cache
sudo kubectl delete service tsystem-ui

# Delete PVCs
sudo kubectl delete -f ./tsystem-api-pvc.yaml
sudo kubectl delete -f ./tsystem-cache-pvc.yaml

# Delete PVs
sudo kubectl delete -f ./tsystem-api-pv.yaml
sudo kubectl delete -f ./tsystem-cache-pv.yaml

# Delete ConfigMap
sudo kubectl delete -f ./tsystem-config.yaml
