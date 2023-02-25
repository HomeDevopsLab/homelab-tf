terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    external = {
      source  = "hashicorp/external"
      version = "2.2.3"
    }
  }
  backend "local" {
    path = "/home/ubuntu/terraform/terraform.tfstate"
  }
}