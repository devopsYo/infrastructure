#!/bin/sh

ressourceGroupMgmt=$RESSOURCE_GROUP_MGMT
storageAccountMgmt=$STORAGE_ACCOUNT_MGMT
containerTfName=$CONTAINER_TF_NAME
keyTfContainer=$KEY_TF_CONTAINER

terraform init \
  -backend-config="resource_group_name=$ressourceGroupMgmt" \
  -backend-config="storage_account_name=$storageAccountMgmt" \
  -backend-config="container_name=$containerTfName" \
  -backend-config="key=$keyTfContainer"
