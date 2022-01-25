variable "domain_name" {
  type = string

  description = <<EOS
Domain name which shall be used as sender domain by SES.
EOS
}

variable "route53_zone_id" {
  type = string

  description = <<EOS
ID of the Route53 hosted zone to which all DNS records shall be added.

The domain name specified as `var.domain_name` must be within the Route53 hosted zone specified by this parameter.
EOS
}

variable "sns_topic_name" {
  type = string

  description = <<EOS
Name of SNS topic
EOS
}

variable "tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Tags which will be attached to all resources.
EOS
}
