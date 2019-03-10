output "name_servers" {
  value = ["${aws_route53_zone.treythomas_me.name_servers}"]
}
