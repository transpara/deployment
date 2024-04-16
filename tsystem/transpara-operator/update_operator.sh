cp -r ../../tsystem/helm ./helm-charts/tsystem
cp -r ../../tstore-interface/helm ./helm-charts/tstoreinterface
cp -r ../../tauth/helm ./helm-charts/tauth

sudo make docker-build docker-push bundle bundle-build bundle-push catalog-build catalog-push