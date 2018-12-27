#!/usr/bin/env sh

# gcp
terraform apply # in terraform dir
gcloud container clusters get-credentials argo --zone asia-northeast1-a --project hideto0710dev-terraform-admin

# admin
kubectl create clusterrolebinding hideto0710-cluster-admin-binding --clusterrole=cluster-admin --user=hideto0710.dev@gmail.com
kubectl create rolebinding default-admin --clusterrole=admin --serviceaccount=default:default

# argo-cd
kubectl create ns argocd
kubectl apply -n argocd -f cd/argocd.yaml

# install argocd cli
brew install --build-from-source ./argocd.rb
kubectl port-forward svc/argocd-server 8081:80 -n argocd
kubectl get pods -n argocd -l app=argocd-server -o name | cut -d'/' -f 2
argocd login localhost:8081
