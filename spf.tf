resource "aws_route53_record" "txt" {
  zone_id = var.route53_zone_id
  name    = "${var.domain_name}."
  type    = "TXT"
  ttl     = 600

  records = [
    "v=spf1 include:amazonses.com ~all",
  ]
}
