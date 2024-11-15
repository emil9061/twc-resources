resource "twc_ssh_key" "twc-key" {
    name = "ssh key ${local.vm.os}" 
    body = file(local.vm.spec.network.ssh.public_key)
}

data "twc_configurator" "configurator" {
    location = local.vm.location
    disk_type = local.vm.spec.storage.disk_type
}

data "twc_os" "os" {
    name = split(":", local.vm.os)[0]
    version = split(":", local.vm.os)[1]
}

resource "twc_server" "virtual-machine" {
    name = local.vm.name
    os_id = data.twc_os.os.id
    ssh_keys_ids = [twc_ssh_key.twc-key.id]

    configuration {
        configurator_id = data.twc_configurator.configurator.id
        disk = 1024 * local.vm.spec.storage.size_gb
        cpu = 1 * local.vm.spec.cpu_cores
        ram = 1024 * local.vm.spec.ram_gb
    }
    cloud_init = local.vm.spec.cloud_init
}

resource "twc_server_ip" "public-ipv4" {
  count = local.vm.spec.network.public_ip ? 1 : 0
  source_server_id = twc_server.virtual-machine.id
  type = "ipv4"
}

output "PublicIP" {
  value = local.vm.spec.network.public_ip ? twc_server_ip.public-ipv4[0].ip : "No public IP is assigned"
  description = "Public IP"
}