terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "2.9.13"
    }
  }
}

provider "proxmox" {
  pm_api_url          = var.proxmox_api_url
  pm_api_token_id     = var.proxmox_api_token_id
  pm_api_token_secret = var.proxmox_api_token_secret

  pm_tls_insecure = true // Allows for untrusted SSL certificate
}

module "k8s-vms" {
  source = "./modules/k8s-vms"

  ciuser      = "serveradmin"
  clone       = "ubuntu-cloud" // Template within Proxmox to clone from
  cores       = 4              // Cores per vm
  count_var   = 5              // Number of vms to be created
  disk_size   = "40G"          // VM disk size
  memory      = 6144           // RAM per VM
  ssh_key     = var.ssh_key    // Pass through ssh key variable
  target_node = "helium"       // Name of Proxmox node to create VMs on
}

