#!/bin/sh

$varFile = ${ENV}.tfvars

terraform plan -var-file="$varFile"

