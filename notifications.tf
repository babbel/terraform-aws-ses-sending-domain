resource "aws_sns_topic" "this" {
  name = var.sns_topic_name
  tags = var.tags
}

resource "aws_ses_identity_notification_topic" "bounce" {
  identity                 = aws_ses_domain_identity.this.domain
  notification_type        = "Bounce"
  include_original_headers = true

  topic_arn = aws_sns_topic.this.arn
}

resource "aws_ses_identity_notification_topic" "complaint" {
  identity                 = aws_ses_domain_identity.this.domain
  notification_type        = "Complaint"
  include_original_headers = true

  topic_arn = aws_sns_topic.this.arn
}
