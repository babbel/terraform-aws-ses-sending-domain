output "ses_domain_identity" {
  value = aws_ses_domain_identity.this

  description = <<EOS
The configured SES sending domain.
EOS
}

output "sns_topic" {
  value = aws_sns_topic.this

  description = <<EOS
SNS topic receiving bounce and complaint notifications from the configured SES sending domain.
EOS
}
