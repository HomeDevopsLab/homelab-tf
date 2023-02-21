resource "null_resource" "k3s_master_node" {
  connection {
    type     = "ssh"
    host     = var.master_node
    user     = var.vm_user
    password = var.vm_pass
  }
  provisioner "remote-exec" {
    inline = [
      "echo ${var.vm_pass} | sudo -S date",
      "curl -sfL https://get.k3s.io | sh -"
    ]
  }
}

data "external" "k3s_master_token" {
  depends_on = [
    null_resource.k3s_master_node
  ]
  program = ["/bin/bash", "-c", "echo \"{\\\"token\\\":\\\"$(sshpass -p ${var.vm_pass} ssh -o StrictHostKeyChecking=no ${var.vm_user}@${var.master_node} \"echo ${var.vm_pass} | sudo -S cat /var/lib/rancher/k3s/server/node-token\")\\\"}\""]
}

output "k3s_master_token" {
  description = "K3S token needed for worker nodes"
  value       = data.external.k3s_master_token.result.token
  sensitive = true
}