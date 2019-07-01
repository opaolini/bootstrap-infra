About
===

This `docker-compose` file spins up a [0x-mesh](https://github.com/0xProject/0x-mesh) with a preconfigured logging driver as well as a `fluentbit` logger which ships the logs to a ES-cluster running on minikube.

To enable this example, we need to first port-forward the `elasticsearch-client` for it to be available:
```
kubectl get pods -n logging | grep client
```
```
kubectl port-forward -n logging es-client-****** 9200
```

## dockerhost container

If running on MacOS you [cannot use the host network](https://docs.docker.com/network/network-tutorial-host/#prerequisites) hence a workaround using a forwarder.

Refer to: https://github.com/qoomon/docker-host

## es-auth-proxy example TODO

Inside the docker-compose we have a forwarding proxy, that will use the node's privatekey to sign requests, and forward them to `auth-es-proxy` inside the cluster which checks the signatures against known public keys. 

To have this setup fully working, start off by deploying the proxy the cluster:
```
kubectl apply -f ./env/mesh/1-proxy.yaml
```

Fetch the running pod name:
```
kubectl get pods -n logging | grep es-prxy

...
es-proxy-686dd479cc-dpznn                    1/1     Running     0          8m24s
```

Then forward the port of the proxy like so:
```
kubectl port-forward -n logging es-proxy-686dd479cc-dpzn 3334
```

After that your logs should appear in Kibana under the `mesh_outside` index.



## TODOs

- [ ] Add a remote and authenticated log-shipping example to the produciton cluster.
