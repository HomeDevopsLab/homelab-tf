resource "local_file" "k3s_config" {
  content_base64 = data.external.k3s_kube_config.result.kube_config
  filename       = "/tmp/foo.bar"
}