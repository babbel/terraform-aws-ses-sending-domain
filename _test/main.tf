provider "aws" {
  region = "local"
}

module "ses-sending-domain" {
  source = "./.."

  domain_name = "example.com"
  route53_zone = {
    zone_id = "123"
  }
  sns_topic_name = "foo"

  default_tags = {
    app = "example"
    env = "test"
  }
}
