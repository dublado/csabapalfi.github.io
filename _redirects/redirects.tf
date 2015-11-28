provider "aws" {
  region = "eu-west-1"
}

module "redirect_csaba-palfi-me" {
  source = "github.com/SmartThingsOSS/tf_aws_route53_redirect"
  region = "eu-west-1"
  domain = "csaba.palfi.me"
  target = "https://csabapalfi.github.io"
  zone_id = "Z14HCOFFTUBVGB"
}
module "redirect_palfi-me" {
  source = "github.com/SmartThingsOSS/tf_aws_route53_redirect"
  region = "eu-west-1"
  domain = "palfi.me"
  target = "https://csabapalfi.github.io"
  zone_id = "Z14HCOFFTUBVGB"
}
