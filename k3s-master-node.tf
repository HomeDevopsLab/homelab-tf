resource "null_resource" "k3s_master_node" {
  connection {
    type     = "ssh"
    host     = var.master_node
    user     = var.vm_user
    password = var.vm_pass
  }
  provisioner "remote-exec" {
    inline = [
      "curl -sfL https://get.k3s.io | echo ${var.vm_pass} | sudo -S sh -"
    ]
  }
}