provider "remote" {
  alias = "k3s-master-node"
  max_sessions = 2
  conn {
    host = var.master_node
    user = var.vm_user
    password = vm_pass
    sudo = true
  }
}

data "remote_file" "master_token" {
  provider = remote.k3s-master-node
  path = "/var/lib/rancher/k3s/server/node-token"
}

output "master_token" {
  description = "Master token for adding worker nodes"
  value = data.remote_file.master_token
  sensitive = true
}