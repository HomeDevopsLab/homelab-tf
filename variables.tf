variable "master_node" {
  description = "K3S Master Node"
  type        = string
  default     = "1.1.1.1"
}

variable "worker_nodes" {
  description = "List of K3s worker nodes"
  type        = list(any)
  default     = ["2.2.2.2"]
}

variable "vm_user" {
  description = "Generic VM login"
  type        = string
  default     = "generic"
}

variable "vm_pass" {
  description = "Generic VM user password"
  type        = string
  default     = "secret"
}

variable "home_dir" {
  description = "Home dir path"
  type = string
  default = "/home/ubuntu"
}