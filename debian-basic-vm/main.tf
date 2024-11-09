terraform {
  required_providers {
    twc = {
        source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
  }
  required_version = ">= 0.13"
}

resource "twc_ssh_key" "twc-key" {
    name = "Debian 12 basic VM SSH key"
    body = file("~/.ssh/keys/timeweb-cloud.pub")
}

data "twc_configurator" "configurator" {
    location = "nl-1"
    disk_type = "nvme"
}

data "twc_os" "os" {
    name = "debian"
    version = "12"
}

resource "twc_server" "debian12-basic-vm" {
    name = "debian12-basic-vm"
    os_id = data.twc_os.os.id
    ssh_keys_ids = [twc_ssh_key.twc-key.id]

    configuration = {
        configurator_id = data.twc_configurator.configurator.id
        disk = 15360
        cpu = 2
        ram = 2048
    }
}