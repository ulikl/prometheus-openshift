oc login -u system:admin

oc new-project monitoring
oc create configmap dashboards-grafana --from-file=dashboards/
oc new-app -p NAMESPACE=monitoring -f monitoring-template.yaml
 
oc annotate ns monitoring openshift.io/node-selector= --overwrite
oc create -f node-exporter.yaml
oc adm policy add-scc-to-user -z prometheus-node-exporter -n monitoring hostaccess