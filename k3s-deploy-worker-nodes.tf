resource "null_resource" "k3s_worker_nodes" {
  depends_on = [
    data.external.k3s_master_token
  ]

  for_each = toset(var.worker_nodes)

  connection {
    type     = "ssh"
    host     = each.key
    user     = var.vm_user
    password = var.vm_pass
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${var.vm_pass} | sudo -S date",
      "curl -sfL https://get.k3s.io | K3S_URL=https://${var.master_node}:6443 K3S_TOKEN=${k3s_master_token} sh -"
    ]
  }
}