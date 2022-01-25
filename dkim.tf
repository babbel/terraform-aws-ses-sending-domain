resource "aws_ses_domain_dkim" "this" {
  domain = aws_ses_domain_identity.this.domain

  depends_on = [aws_ses_domain_identity_verification.this]
}

resource "aws_route53_record" "domainkey_cname" {
  count = 3

  zone_id = var.route53_zone_id
  name    = "${aws_ses_domain_dkim.this.dkim_tokens[count.index]}._domainkey.${var.domain_name}."
  type    = "CNAME"
  ttl     = 3600

  records = [
    "${aws_ses_domain_dkim.this.dkim_tokens[count.index]}.dkim.amazonses.com.",
  ]
}
