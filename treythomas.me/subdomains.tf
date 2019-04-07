# delegated subdomains

resource "aws_route53_record" "subdomain_delegation" {
  count = "${length(var.subdomain_delegations)}"

  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = "${var.subdomain_delegations[count.index]}"
  type = "NS"
  ttl = "600"
  records = ["${split(",", var.subdomain_delegations_ns[count.index])}"]
}
