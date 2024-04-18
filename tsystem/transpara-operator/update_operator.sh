#!/bin/bash

# Create directories and copy files for tsystem
mkdir -p ./helm-charts/tsystem
cp -r ../../tsystem/helm/* ./helm-charts/tsystem

# Create directories and copy files for tstore-interface
mkdir -p ./helm-charts/tstoreinterface
cp -r ../../tstore-interface/helm/* ./helm-charts/tstoreinterface

# Create directories and copy files for tauth
mkdir -p ./helm-charts/tauth
cp -r ../../tauth/helm/* ./helm-charts/tauth