terraform {
  backend "azurerm" {
	}
}

provider "azurerm" {
  features {}
}

module "Infrastructure" {
  source                  = "../../modules/azure-infrastructure"
  infra_config            = var.config
}

