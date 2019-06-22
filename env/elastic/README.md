About
===

This directory holds all the charts and configuration files necessary for a working, production-ready deployment of the EFK stack.

This deployment uses an [Elasticsearch Operator](https://github.com/upmc-enterprises/elasticsearch-operator) to manage the ES cluster. If deployed on AWS EKS, it has a nice feature of storing snapshots to S3.

The es cluster can be dynamically resized.

## Getting started

We can deploy a Elasticsearch operator like so:
```
helm install --name es-operator \
     --namespace kube-system \
     ./charts/elasticsearch-operator \
     -f values.yaml
```
