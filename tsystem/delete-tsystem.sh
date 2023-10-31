#!/bin/bash

sudo kubectl delete -f ./tsystem-api-pv.yaml
sudo kubectl delete -f ./tsystem-api-pvc.yaml
sudo kubectl delete -f ./tsystem-api.yaml
sudo kubectl delete -f ./tsystem-cache.yaml
sudo kubectl delete -f ./tsystem-config.yaml
sudo kubectl delete -f ./tsystem-ui.yaml