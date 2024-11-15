locals {
  vm = yamldecode(file("./configuration.yaml"))
}