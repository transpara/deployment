#!/bin/bash

sudo kubectl apply -f ./tsystem-api-pv.yaml
sudo kubectl apply -f ./tsystem-api-pvc.yaml
sudo kubectl apply -f ./tsystem-api.yaml
sudo kubectl apply -f ./tsystem-cache.yaml
sudo kubectl apply -f ./tsystem-config.yaml
sudo kubectl apply -f ./tsystem-ui.yaml