terraform {
  backend "remote" {
    # The name of your Terraform Cloud organization.
    organization = "Rod-training"
    # The name of the Terraform Cloud workspace to store Terraform state files in.
    workspaces {
      name = "basic_github_actions_demo"
    }
  }
}

variable "ARM_SUBSCRIPTION_ID" {}
variable "ARM_CLIENT_ID" {}
variable "ARM_CLIENT_SECRET" {}
variable "ARM_TENANT_ID" {}

provider "azurerm" {
  features {}

  subscription_id = var.ARM_SUBSCRIPTION_ID
  client_id       = var.ARM_CLIENT_ID
  client_secret   = var.ARM_CLIENT_SECRET
  tenant_id       = var.ARM_TENANT_ID
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "tamops" {
  name     = "tamops"
  location = "eastus2"
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}
