# Terraform module creating AWS SES sending domain

This module configures a sending domain for SES allowing email addresses with
that domain to be used in the `From` field of the emails sent via SES.

This includes the following components:

* [SES domain verification](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/verify-domain-procedure.html)
* [Bounce and complaint notification to SNS](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/monitor-sending-activity-using-notifications-sns.html)
* [SPF](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-authentication-spf.html)
* [DKIM](https://docs.aws.amazon.com/ses/latest/DeveloperGuide/send-email-authentication-dkim-easy-setup-domain.html)

## Example

```tf
resource "aws_route53_zone" "email-example" {
  name = "email.example.com"
}

module "ses-sending-domain-example" {
  source  = "babbel/ses-sending-domain/aws"
  version = "~> 1.2"

  domain_name    = "example.com"
  route53_zone   = aws_route53_zone.email-example
  sns_topic_name = "example"

  tags = {
    environment = "production"
  }
}
```
