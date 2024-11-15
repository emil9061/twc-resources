# Timeweb Cloud resources

### Prepare environment
```
export TWC_TOKEN=<token>
export AWS_ACCESS_KEY_ID=<access_key>
export AWS_SECRET_ACCESS_KEY=<secret_key>
export TF_CLI_CONFIG_FILE=/path/to/.terraformrc
alias tf=terraform
```

### .tfrc
```
provider_installation {
  network_mirror {
    url = "https://terraform-mirror.yandexcloud.net/"
    include = ["registry.terraform.io/*/*"]
  }
  direct {
    exclude = ["registry.terraform.io/*/*"]
  }
}
```