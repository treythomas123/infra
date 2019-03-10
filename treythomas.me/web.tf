locals {
  s3_origin_id = "static"
}

resource "aws_cloudfront_distribution" "treythomas_me" {
  aliases = ["treythomas.me", "www.treythomas.me"]
  enabled = true
  is_ipv6_enabled = true
  default_root_object = "index.html"
  price_class = "PriceClass_100"

  viewer_certificate {
    acm_certificate_arn = "${aws_acm_certificate.treythomas_me.arn}"
    ssl_support_method = "sni-only"
    minimum_protocol_version = "TLSv1.1_2016"
  }

  origin {
    domain_name = "${aws_s3_bucket.treythomas_me.bucket_regional_domain_name}"
    origin_id = "${local.s3_origin_id}"
    s3_origin_config {
      origin_access_identity = "${aws_cloudfront_origin_access_identity.treythomas_me.cloudfront_access_identity_path}"
    }
  }

  default_cache_behavior {
    target_origin_id = "${local.s3_origin_id}"
    viewer_protocol_policy = "redirect-to-https"
    allowed_methods = ["GET", "HEAD"]
    cached_methods = ["GET", "HEAD"]

    forwarded_values {
      query_string = false

      cookies {
        forward = "none"
      }
    }
  }

  logging_config {
    include_cookies = false
    bucket = "${aws_s3_bucket.treythomas_me_logs.bucket_domain_name}"
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
}

resource "aws_cloudfront_origin_access_identity" "treythomas_me" {}

resource "aws_s3_bucket" "treythomas_me" {
  bucket = "treythomas.me"
}

resource "aws_s3_bucket" "treythomas_me_logs" {
  bucket = "treythomas.me-logs"
}

data "aws_iam_policy_document" "treythomas_me_cloudfront_s3_policy" {
  statement {
    actions = ["s3:GetObject"]
    resources = ["${aws_s3_bucket.treythomas_me.arn}/*"]

    principals {
      type = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.treythomas_me.iam_arn}"]
    }
  }

  statement {
    actions = ["s3:ListBucket"]
    resources = ["${aws_s3_bucket.treythomas_me.arn}"]

    principals {
      type = "AWS"
      identifiers = ["${aws_cloudfront_origin_access_identity.treythomas_me.iam_arn}"]
    }
  }
}

resource "aws_s3_bucket_policy" "treythomas_me_cloudfront_s3" {
  bucket = "${aws_s3_bucket.treythomas_me.id}"
  policy = "${data.aws_iam_policy_document.treythomas_me_cloudfront_s3_policy.json}"
}
