#
# The module is usually called from a 
# top level repository.
#
module "bastion" {
  source = "git::https://github.com/Cloud-42/terraform-aws-bastion.git"

  environment         = "prod"
  key_name            = "ec2_key"
  image_id            = data.aws_ami.latest_amazon_linux_ami_useast2.id
  orchestration       = "https://github.com/build"
  vpc_zone_identifier = ["${element(split(",", module.vpc.subnets_public), 0)}", "${element(split(",", module.vpc.subnets_public), 1)}"]
  security_groups     = "sg-xyxyxyxyzz"
  dns_domain_name     = "prod.domain.io"
  hosted_zone_id      = "XYXYJ44DTY4JS"
}
