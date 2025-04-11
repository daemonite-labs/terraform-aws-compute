module "ec2_bastion" {
  count = var.ec2_bastion ? 1 : 0

  source = "./modules/ec2-bastion"

  tags              = var.ec2_bastion.tags
  identifier        = var.ec2_bastion.identifier
  ec2_instance_type = var.ec2_bastion.ec2_instance_type
  vpc_id            = var.ec2_bastion.vpc_id
  subnet_id         = var.ec2_bastion.subnet_id
  test_network_cidr = var.ec2_bastion.test_network_cidr
}
