#!/bin/bash

rm -rf ./helm-charts

# Create directories and copy files for helm charts
mkdir -p ./helm-charts/tsystem
cp -r ../../tsystem/helm/* ./helm-charts/tsystem

mkdir -p ./helm-charts/tstoreinterface
cp -r ../../tstore-interface/helm/* ./helm-charts/tstoreinterface

mkdir -p ./helm-charts/tauth
cp -r ../../tauth/helm/* ./helm-charts/tauth

# Interfaces
mkdir -p ./helm-charts/extractorodbc
cp -r ../../interfaces/extractor-odbc/helm/* ./helm-charts/extractorodbc

mkdir -p ./helm-charts/extractoropcua
cp -r ../../interfaces/extractor-opcua/helm/* ./helm-charts/extractoropcua

mkdir -p ./helm-charts/collectortelegraf
cp -r ../../interfaces/collector-telegraf/helm/* ./helm-charts/collectortelegraf

make docker-build docker-push bundle bundle-build bundle-push catalog-build catalog-push