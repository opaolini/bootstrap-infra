WIP - Bootstrap Infrastructure
===

This repo contains a reference infrastructure setup that you can change to your own liking.

The idea being, whether you are developing an application/set of services/operators you'd want a consistent environment

# Motivation

Local and Proper/Production setup

# Requirements

## Common Requirements
* `helm` - https://helm.sh/docs/using_helm/#installing-helm
* `kubectl` - https://kubernetes.io/docs/tasks/tools/install-kubectl/

## Local Deployment Requirements

* `minikube` - https://kubernetes.io/docs/setup/learning-environment/minikube/
  * optional/recommended - `hyperkit` -> https://github.com/moby/hyperkit

## Production Deployment Requirements
* `terraform` - https://www.terraform.io/

# Quick Start

## Minikube setup (OSX)

Start `minikube` 

```bash
$ minikube start --vm-driver hyperkit --memory 8192 --cpus 4
```

# Helm Initialization
```bash
$ kubectl create serviceaccount tiller --namespace kube-system
$ kubectl create clusterrolebinding tiller-role-binding --clusterrole cluster-admin --serviceaccount=kube-system:tiller
$ helm init --service-account tiller
```
# Installing Prometheus Operator
$ helm install stable/prometheus-operator --version=4.3.6 --name=monitoring --namespace=monitoring --values=values_minikube.yaml

For local development, once you install all the requests

## Proper Setup

Setup the cluster using the provided terraform configs from the major cloud providers (or add your own). All the outputs from the terraform configs include the guide on how to setup `kubectl` for the deployed cluster.

# Folder Structure

The folder structure is grouped as follows:

* `/charts` - contains packaged charts (i.e. those not provided by the official `stable` repository), chart scripts, and related information
  * `/charts/observability` - aggregated logging, metrics, elasticsearch etc.
  * `/charts/controller` - Prometheus, Let's Encrypter issuers
* `/tf` - terraform config charts for deploying
  * `AWS EKS`
  * `GCP GKE`
  * `DO Kubernetes Engine`
  * `tectonic`
* `/env` - infrastructure environment, contains the 
  * `/env/monitoring` - grafana, kibana
  * `/env/elasticsearch` - elasticsearch cluster


# TODOs

- [ ] Create some basic setup scripts and/or CLI tools to automate all of the bootstrapping phase (especially locally)
- [ ] Describe pushing docker / images workflow with local deployment
