resource "aws_route53_record" "cloudfront" {
  zone_id = "${var.hosted_zone_id}"
  name = ""
  type = "A"

  alias {
    name = "${aws_cloudfront_distribution.treythomas_me.domain_name}."
    zone_id = "${aws_cloudfront_distribution.treythomas_me.hosted_zone_id}"
    evaluate_target_health = false
  }
}

resource "aws_route53_record" "cloudfront_www" {
  zone_id = "${var.hosted_zone_id}"
  name = "www"
  type = "CNAME"
  ttl = "300"
  records = ["${aws_cloudfront_distribution.treythomas_me.domain_name}."]
}

