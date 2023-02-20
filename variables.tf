variable "master_node" {
  description = "K3S Master Node"
  type        = String
  default     = ["1.1.1.1"]
}

variable "vm_user" {
  description = "Generic VM login"
  type        = String
  default     = "generic"
}

variable "vm_pass" {
  description = "Generic VM user password"
  type        = String
  default     = "secret"
}