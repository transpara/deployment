# **Helm Chart Documentation**

This Helm chart is based on the official **Telegraf** Helm chart provided by **Telegraf**.

**Source:** [Telegraf Helm Charts on GitHub](https://github.com/influxdata/helm-charts/tree/master/charts/telegraf)



## **Modifications to the Original Helm Chart**

### **File:** `service.yaml`  

**Change Location:** Line 15  
**Change Description:** Included dynamic port mapping from `values.yaml` using `{{ toYaml .Values.service.ports | indent 4 }}`.



### **File:** `deployment.yaml`  

**Change Location:** Added `ports` section within the container specification.  
**Change Description:** Added dynamic port mapping for the `tStoreInterface` service from `values.yaml` using `{{ toYaml .Values.tStoreInterface.ports | indent 10 }}`.



