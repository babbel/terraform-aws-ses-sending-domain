variable "configure_spf" {
  type    = bool
  default = true

  description = <<EOS
Whether to configure SPF record for the domain.
EOS
}

variable "default_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to all AWS resources created by this module.
EOS
}

variable "domain_name" {
  type = string

  description = <<EOS
Domain name which shall be used as sender domain by SES.
EOS
}

variable "route53_zone" {
  type = object({
    zone_id = string
  })

  description = <<EOS
The Route53 hosted zone to which all DNS records shall be added.

The domain name specified as `var.domain_name` must be within the Route53 hosted zone specified by this parameter.
EOS
}

variable "sns_topic_name" {
  type = string

  description = <<EOS
Name of SNS topic.
EOS
}

variable "sns_topic_tags" {
  type    = map(string)
  default = {}

  description = <<EOS
Map of tags assigned to the SNS topic created by this module. Tags in this map will override tags in `var.default_tags`.
EOS
}
