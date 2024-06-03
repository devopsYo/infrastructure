#requires -PSEdition Core

#curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash


$ressourceGroupMgmt = $env:RESSOURCE_GROUP_MGMT
$storageAccountMgmt = $env:STORAGE_ACCOUNT_MGMT
$locationsMgmt = $env:LOCATION_MGMT
$containerTFName = $env:CONTAINER_TF_NAME
$subscriptionName = $env:SUBSCRIPTION_NAME

az account set -s $subscriptionName

$rgExists = az group exists -n $ressourceGroupMgmt
$storageAvailable = az storage account check-name -n $storageAccountMgmt --query nameAvailable 

if ($storageAvailable -eq $true) {
  az storage account create --name $storageAccountMgmt --resource-group $ressourceGroupMgmt --location $locationsMgmt --sku Standard_LRS
  az storage container create --name $containerTFName --account-name $storageAccountMgmt
}