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

provider "azurerm" {
  features {}
}

data "azurerm_client_config" "current" {}

resource "azurerm_resource_group" "tamops" {
  name = "tamops"
  location = "eastus2"
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}
