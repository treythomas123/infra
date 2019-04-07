resource "aws_acm_certificate" "home" {
  domain_name = "*.home.${var.parent_domain}"
  subject_alternative_names = ["home.${var.parent_domain}"]
  validation_method = "DNS"
}
