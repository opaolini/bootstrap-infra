echo "Installing K8s Dashboard"
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v1.10.1/src/deploy/recommended/kubernetes-dashboard.yaml
echo "Initializing helm"
echo "Creating service account for tiller"
kubectl create serviceaccount tiller --namespace kube-system
echo "Creating cluster role binding for tiller"
kubectl create clusterrolebinding tiller-role-binding --clusterrole cluster-admin --serviceaccount=kube-system:tiller
echo "Installing tiller"
helm init --service-account tiller
sleep 30
echo "Installing Prometheus Operator"
kubectl create namespace prometheus
helm install stable/prometheus \
     --name prometheus \
     --namespace prometheus \
     --set alertmanager.persistentVolume.storageClass="gp2" \
     --set server.persistentVolume.storageClass="gp2"
echo "Installing Grafana"
echo "IMPORT DASHBOARD #6417"
kubectl create namespace grafana
helm install stable/grafana \
     --name grafana \
     --namespace grafana \
     --set persistence.storageClassName="gp2" \
     --set adminPassword="bootstrapadmin" \
     --set datasources."datasources\.yaml".apiVersion=1 \
     --set datasources."datasources\.yaml".datasources[0].name=Prometheus \
     --set datasources."datasources\.yaml".datasources[0].type=prometheus \
     --set datasources."datasources\.yaml".datasources[0].url=http://prometheus-server.prometheus.svc.cluster.local \
     --set datasources."datasources\.yaml".datasources[0].access=proxy \
     --set datasources."datasources\.yaml".datasources[0].isDefault=true \
     --set service.type=LoadBalancer
echo "Installing metrics-server"
helm install stable/metrics-server \
     --name metrics-server \
     --namespace metrics
echo "Installing elastic stack & kibana"
helm install --name elastic-main-release --namespace elastic stable/elastic-stack
echo "Installing cert-manager"
