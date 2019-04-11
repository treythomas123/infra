resource "aws_route53_record" "mx" {
  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = ""
  type = "MX"
  ttl = "1800"
  records = [
    "10 mx1.privateemail.com",
    "10 mx2.privateemail.com",
  ]
}

resource "aws_route53_record" "mail_txt" {
  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = ""
  type = "TXT"
  ttl = "1800"
  records = ["v=spf1 include:spf.privateemail.com ~all"]
}

resource "aws_route53_record" "mail_cname" {
  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = "mail"
  type = "CNAME"
  ttl = "1800"
  records = ["privateemail.com."]
}

resource "aws_route53_record" "mail_autodiscover_cname" {
  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = "autodiscover"
  type = "CNAME"
  ttl = "1800"
  records = ["privateemail.com."]
}

resource "aws_route53_record" "mail_autoconfig_cname" {
  zone_id = "${aws_route53_zone.treythomas_me.zone_id}"
  name = "autoconfig"
  type = "CNAME"
  ttl = "1800"
  records = ["privateemail.com."]
}
