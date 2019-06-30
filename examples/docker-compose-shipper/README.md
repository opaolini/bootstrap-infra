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

## es-auth-proxy TODO

Inside the docker-compose we have a forwarding proxy, that will use the node's privatekey to sign requests to elasticsearch. 


## TODOs

- [ ] Add a remote and authenticated log-shipping example to the produciton cluster.
