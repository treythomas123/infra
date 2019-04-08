resource "aws_route53_zone" "home" {
  name = "home.${var.parent_domain}."
}

resource "aws_route53_record" "home_public_alias" {
  zone_id = "${aws_route53_zone.home.zone_id}"
  name = "home.treythomas.me."
  type = "A"

  alias {
    name = "public.home.treythomas.me."
    zone_id = "${aws_route53_zone.home.zone_id}"
    evaluate_target_health = false
  }
}
