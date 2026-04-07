#!/bin/bash
awslocal ec2 create-key-pair --key-name ec2_vm_manager

tflocal plan -target "helm_release.csi_secrets_store"
tflocal apply -target "helm_release.csi_secrets_store" -auto-approve

tflocal plan -target "helm_release.aws_secrets_provider"
tflocal apply -target "helm_release.aws_secrets_provider" -auto-approve

tflocal plan
tflocal apply -auto-approve

