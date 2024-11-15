terraform {
  backend "s3" {
    endpoint = "https://s3.timeweb.cloud"
    region = "ru-1"
    bucket = "ef8d0834-bucket"
    key = "tfstate/terraform.tfstate"
    skip_credentials_validation = true
    skip_region_validation = true
    skip_metadata_api_check = true
  }
}