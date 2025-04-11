data "aws_ebs_default_kms_key" "current" {}

data "aws_vpc" "this" {
  id = var.vpc_id
}

data "aws_kms_alias" "current" {
  name = data.aws_ebs_default_kms_key.current.key_arn
}

data "aws_ami" "amazon_linux" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_iam_policy_document" "assume_role" {
  statement {
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}
