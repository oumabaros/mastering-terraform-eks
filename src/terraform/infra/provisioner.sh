#!/bin/bash
awslocal ec2 create-key-pair --key-name ec2_vm_manager

tflocal plan -target "random_shuffle.az"
tflocal apply -target "random_shuffle.az" -auto-approve

tflocal plan -target "aws_iam_user.admin"
tflocal apply -target "aws_iam_user.admin" -auto-approve

tflocal plan -target "aws_iam_user.ecr_image_pushers"
tflocal apply -target "aws_iam_user.ecr_image_pushers" -auto-approve

tflocal plan -target "aws_ecr_repository.main"
tflocal apply -target "aws_ecr_repository.main" -auto-approve

tflocal plan -target "aws_eks_node_group.main"
tflocal apply -target "aws_eks_node_group.main" -auto-approve

#tflocal plan
tflocal apply -auto-approve




