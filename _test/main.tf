module "ses-sending-domain" {
  source = "./.."

  domain_name     = "example.com"
  route53_zone_id = "123"
  sns_topic_name  = "foo"
  tags            = {}
}
