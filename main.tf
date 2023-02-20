terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
    required_providers {
      remote = {
        source = "tenstad/remote"
        version = "0.1.1"
      }
    }
  }
  backend "local" {
    path = "/home/ubuntu/k3s/terraform.tfstate"
  }
}