// Proxmox server API endpoint
variable "proxmox_api_url" {
  type = string
}
// Proxmox API token ID
variable "proxmox_api_token_id" {
  type      = string
  sensitive = true
}
// Proxmox API token Secret
variable "proxmox_api_token_secret" {
  type      = string
  sensitive = true
}
// SSH Public Key
variable "ssh_key" {
  type      = string
  sensitive = true
}