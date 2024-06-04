#!/bin/sh

varFile=$TFVARS

terraform plan -var-file="$varFile"

