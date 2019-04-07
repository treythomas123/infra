provider "aws" {
  region = "us-east-1"
  version = "~> 2.1"
}

module "treythomas_me" {
  source = "./treythomas.me"
}
