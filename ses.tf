resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_route53_record" "amazonses_txt" {
  zone_id = var.route53_zone.zone_id
  name    = "_amazonses.${var.domain_name}."
  type    = "TXT"
  ttl     = 600

  records = [
    aws_ses_domain_identity.this.verification_token,
  ]
}

resource "aws_ses_domain_identity_verification" "this" {
  domain = aws_ses_domain_identity.this.domain

  depends_on = [aws_route53_record.amazonses_txt]
}
