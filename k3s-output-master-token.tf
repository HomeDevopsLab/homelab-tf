data "remote_file" "master_token" {
  conn {
    host     = var.master_node
    user     = var.vm_user
    password = var.vm_pass
    sudo     = true
  }
  path = "/var/lib/rancher/k3s/server/node-token"
}

output "master_token" {
  description = "Master token for adding worker nodes"
  value       = data.remote_file.master_token
  sensitive   = true
}