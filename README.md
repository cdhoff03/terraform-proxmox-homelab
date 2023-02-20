# Terraform Proxmox Homelab
This repository contains the Terraform files that define the infrastructure of my homelab server, "helium"

[What is Proxmox?](https://en.wikipedia.org/wiki/Proxmox_Virtual_Environment)

[telemate/proxmox Documentation](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs)
## Required Variables
```javascript
proxmox_api_url          = "https://10.0.0.2:8006/api2/json"
proxmox_api_token_id     = "terraform-prov@pve!terraform"
proxmox_api_token_secret = "751d5f0f-a37f-4638-981f-46bb8cb20825"
ssh_key                  = "ssh-rsa AAAAB3NzaC1yc..."
```
    proxmox_api_url
   Defines the API endpoint (http/https) that [telemate/proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest) will use to communicate with your Proxmox Server. 

> example: https&#65279;://10.0.0.2:8006/api2/json

    proxmox_api_token_id
   Defines the API Token ID used to authenticate with Proxmox (see telemate/proxmox documentation for more information)
> example: terraform-prov@pve!terraform

    proxmox_api_token_secret
   Defines the API Token ID used to authenticate with Proxmox (see telemate/proxmox documentation for more information)
> example: 751d5f0f-a37f-4638-981f-46bb8cb20825

    ssh_key
   Defines the SSH key that will be used by CloudInit when creating the VMs
> example: ssh-rsa AAAAB3NzaC1yc...

Note: If I don't add `-parallelism=2` as an argument when applying the terraform code, it results in inconsistency and leads to some VMs not being created. However, your mileage may vary


## Next Steps

 - [ ] use Packer to create VM templates programmatically 
