terraform {
  backend "local" {
    path = "/home/ubuntu/k3s/terraform.tfstate"
  }
}

# An example resource that does nothing.
resource "null_resource" "example" {
  triggers = {
    value = "A example resource that does nothing!"
  }
}