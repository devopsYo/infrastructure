#!/bin/bash

curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

ressourceGroupMgmt=$RESSOURCE_GROUP_MGMT
storageAccountMgmt=$STORAGE_ACCOUNT_MGMT
locationsMgmt=$LOCATION_MGMT
containerTFName=$CONTAINER_TF_NAME
subscriptionName=$SUBSCRIPTION_NAME

az account set --subscription "$subscriptionName"

rgExists=$(az group exists --name "$ressourceGroupMgmt")

storageAvailable=$(az storage account check-name --name "$storageAccountMgmt" --query nameAvailable --output tsv)

if [ "$storageAvailable" = "true" ]; then
  az storage account create --name "$storageAccountMgmt" --resource-group "$ressourceGroupMgmt" --location "$locationsMgmt" --sku Standard_LRS
  az storage container create --name "$containerTFName" --account-name "$storageAccountMgmt"
fi
