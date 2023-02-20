variable "ciuser" {
  type = string
}
variable "clone" {
  type = string
}
variable "cores" {
  type = number
}
variable "count_var" {
  type = number
}
variable "disk_size" {
  type = string
}
variable "memory" {
  type = number
}
variable "ssh_key" {
  type      = string
  sensitive = true
}
variable "target_node" {
  type = string
}