#!/bin/bash

# Apply ConfigMap first as it might be referenced by other resources
sudo kubectl apply -f ./tsystem-config.yaml

# Apply PersistentVolumes and PersistentVolumeClaims
# PVs and PVCs should be created before the StatefulSets that use them
sudo kubectl apply -f ./tsystem-api-pv.yaml
sudo kubectl apply -f ./tsystem-api-pvc.yaml
sudo kubectl apply -f ./tsystem-cache-pv.yaml
sudo kubectl apply -f ./tsystem-cache-pvc.yaml

# Now apply the StatefulSets
# StatefulSets may reference PVs, PVCs, and ConfigMaps
sudo kubectl apply -f ./tsystem-api.yaml
sudo kubectl apply -f ./tsystem-cache.yaml

# Finally, apply the Deployment
# The Deployment may depend on the ConfigMap
sudo kubectl apply -f ./tsystem-ui.yaml
