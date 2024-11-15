terraform {
  required_providers {
    twc = {
      source = "tf.timeweb.cloud/timeweb-cloud/timeweb-cloud"
    }
    null = {
      source = "hashicorp/null"
      version = "3.2.3"
    }
  }
  required_version = ">= 0.13"
}