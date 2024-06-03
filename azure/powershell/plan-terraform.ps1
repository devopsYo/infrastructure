#requires -PSEdition Core

$varFile = $env:TFVARS_SECUREFILEPATH

terraform plan -var-file="$varFile"

