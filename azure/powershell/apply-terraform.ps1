#requires -PSEdition Core

$varFile = $env:TFVARS_SECUREFILEPATH

terraform apply -auto-approve -var-file="$varFile"