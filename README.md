# homelab-tf
This project is designed to deploy k3s on several machines. It supports one master node and several worker nodes.
## Automation
If you want to use terraform workflow, you should add self-hosted runner and label it as **home-runner**.
### Runner configuration
* Create folder: ```/home/ubuntu/k3s```, for terraform.tfstate to be created.
* Create ```/home/ubuntu/tfprod/prod.tfvars``` file with following content  
```
master_node = "10.0.0.10"
worker_nodes = ["10.0.0.11", "10.0.0.12"]
vm_user = "admin"
vm_pass = "adminSecret"
```
## Implemetation notes
If you need to change paths to configuration files, you should update following files:
* **.github/workflows/terraform.yml**: to adjust prod.tfvars filename or path
* **main.tf**: to adjust tfstate file name or path
### Flux