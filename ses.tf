resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}

resource "aws_ses_domain_identity_verification" "this" {
  domain = aws_ses_domain_identity.this.domain

  depends_on = [aws_route53_record.domainkey_cname]
}
