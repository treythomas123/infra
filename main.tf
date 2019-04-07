provider "aws" {
  region = "us-east-1"
  version = "~> 2"
}

module "home_automation" {
  source = "./home-automation"
  parent_domain = "treythomas.me"
}

module "treythomas_me" {
  source = "./treythomas.me"
  subdomain_delegations = ["home"]
  subdomain_delegations_ns = ["${join(",", module.home_automation.name_servers)}"]
}
