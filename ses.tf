resource "aws_ses_domain_identity" "this" {
  domain = var.domain_name
}
