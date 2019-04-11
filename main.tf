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
  hosted_zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
}

module "metrics" {
  source = "./metrics"
  parent_domain = "treythomas.me"
}
