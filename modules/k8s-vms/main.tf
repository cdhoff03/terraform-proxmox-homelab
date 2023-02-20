terraform {
  required_version = ">= 0.13.0"

  required_providers {
    proxmox = {
        source = "telmate/proxmox"
        version = "2.9.13"
    }
  }
}

resource "proxmox_vm_qemu" "kube" {
  count = var.count_var
  name = "kube-0${count.index + 1}"
  target_node = var.target_node
  vmid = "20${count.index + 1}"
  clone = var.clone
  //agent = 1 // TODO: Create image that contains QEMU Guest Utils, uncomment when done
  cores = var.cores
  sockets = 1
  cpu = "host"
  memory = var.memory
  disk {
    slot = 0
    size = var.disk_size
    type = "virtio"
    storage = "local-zfs"
  }
  network {
    model = "virtio"
    bridge = "vmbr0"
    tag = 10
  }
  lifecycle {
    ignore_changes = [
      network,
    ]
  }

  os_type = "cloud-init"
  ciuser = var.ciuser
  ipconfig0 = "ip=10.0.10.2${count.index + 1}/24,gw=10.0.10.1"
  sshkeys = <<EOF
  ${var.ssh_key}
  EOF
}