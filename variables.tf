variable "master_node" {
  description = "K3S Master Node"
  type        = string
  default     = ["1.1.1.1"]
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