#!/bin/bash

# Authenticate with GCP using the service account key
gcloud auth activate-service-account --key-file=<(echo "${GCP_SERVICE_ACCOUNT_KEY}")

# Create the GKE cluster
gcloud container clusters create ${GKE_CLUSTER_NAME} --zone=${GKE_CLUSTER_ZONE} --num-nodes=${GKE_CLUSTER_NUM_NODES}

# Authenticate kubectl with the GKE cluster
gcloud container clusters get-credentials ${GKE_CLUSTER_NAME} --zone=${GKE_CLUSTER_ZONE}

# Verify that kubectl is authenticated with the GKE cluster
kubectl config current-context