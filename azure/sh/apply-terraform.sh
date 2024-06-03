#!/bin/sh

$varFile = ${ENV}.tfvars

terraform apply -auto-approve -var-file="$varFile"