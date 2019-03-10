resource "aws_acm_certificate" "treythomas_me" {
  domain_name = "*.treythomas.me"
  subject_alternative_names = ["treythomas.me"]
  validation_method = "DNS"
}
