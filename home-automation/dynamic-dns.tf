# IAM user for updating the public.home.* DNS entry when my home IP changes

resource "aws_iam_user" "home_dynamic_dns" {
  name = "home-dynamic-dns"
}

resource "aws_iam_access_key" "home_dynamic_dns" {
  user = "${aws_iam_user.home_dynamic_dns.name}"
}

resource "aws_iam_user_policy" "dynamic_dns_home" {
  name = "DynamicDNSHome"
  user = "${aws_iam_user.home_dynamic_dns.name}"
  policy = "${data.aws_iam_policy_document.change_home_dns.json}"
}

data "aws_iam_policy_document" "change_home_dns" {
  statement {
    sid = "1"
    actions = [
      "route53:ListResourceRecordSets",
      "route53:ChangeResourceRecordSets"
    ]
    resources = ["arn:aws:route53:::hostedzone/${aws_route53_zone.home.zone_id}"]
  }
}
