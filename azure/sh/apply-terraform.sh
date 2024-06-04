#!/bin/sh

varFile=$TFVARS

terraform apply -auto-approve -var-file="$varFile"