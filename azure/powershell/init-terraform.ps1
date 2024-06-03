#requires -PSEdition Core

$ressourceGroupMgmt = $env:RESSOURCE_GROUP_MGMT
$storageAccountMgmt = $env:STORAGE_ACCOUNT_MGMT
$containerTfName = $env:CONTAINER_TF_NAME
$keyTfContainer = $env:KEY_TF_CONTAINER

terraform init `
  -backend-config="resource_group_name=$ressourceGroupMgmt" `
  -backend-config="storage_account_name=$storageAccountMgmt" `
  -backend-config="container_name=$containerTfName" `
  -backend-config="key=$keyTfContainer"