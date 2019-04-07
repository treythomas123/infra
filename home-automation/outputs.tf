output "name_servers" {
  value = ["${aws_route53_zone.home.name_servers}"]
}
