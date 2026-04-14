#!/bin/bash
#awslocal ec2 create-key-pair --key-name ec2_vm_manager

awslocal ecr get-login-password --region us-east-1 | \
docker login --username test \
--password-stdin 000000000000.dkr.ecr.us-east-1.localhost.localstack.cloud:4566/ecr-fleet-portal-dev-backend
docker push 000000000000.dkr.ecr.us-east-1.localhost.localstack.cloud:4566/ecr-fleet-portal-dev-backend:2024.06.6

awslocal ecr get-login-password --region us-east-1 | \
docker login --username test \
--password-stdin 000000000000.dkr.ecr.us-east-1.localhost.localstack.cloud:4566/ecr-fleet-portal-dev-frontend
docker push 000000000000.dkr.ecr.us-east-1.localhost.localstack.cloud:4566/ecr-fleet-portal-dev-frontend:2024.05.14

# tflocal plan -target "helm_release.ingress"
# tflocal apply -target "helm_release.ingress" -auto-approve
#kubectl config use-context arn:aws:eks:us-east-1:000000000000:cluster/eks-fleet-portal-dev
# helm repo add secrets-store-csi-driver https://kubernetes-sigs.github.io/secrets-store-csi-driver/charts
# helm install csi-secrets-store secrets-store-csi-driver/secrets-store-csi-driver --namespace kube-system
# kubectl --namespace=kube-system get pods -l "app=secrets-store-csi-driver"

# tflocal plan -target "helm_release.csi_secrets_store"
# tflocal apply -target "helm_release.csi_secrets_store" -auto-approve

# tflocal plan -target "helm_release.aws_secrets_provider"
# tflocal apply -target "helm_release.aws_secrets_provider" -auto-approve

tflocal plan
tflocal apply -auto-approve

# tflocal plan -target "helm_release.ingress"
# tflocal apply -target "helm_release.ingress" -auto-approve