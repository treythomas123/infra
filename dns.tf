resource "aws_route53_zone" "treythomas_me" {
  name = "treythomas.me."
}

resource "aws_route53_record" "home_subdomain_delegation" {
  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = "home"
  type = "NS"
  ttl = "600"
  records = ["${module.home_automation.name_servers}"]
}

