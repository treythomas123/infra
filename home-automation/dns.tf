resource "aws_route53_zone" "home" {
  name = "home.${var.parent_domain}."
}
