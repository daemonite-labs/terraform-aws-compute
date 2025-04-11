# AWS Compute Terraform module

Terraform module which creates compute resources on AWS.

## Usage

Using the root wrapper module:

```hcl
module "compute" {
  source  = "daemonite-labs/compute/aws"

  ec2_bastion = {
    identifier = "compute"
    vpc_id     = "<VPC_ID>"
    subnet_id  = "<SUBNET_ID>"
  }
}
```

Using the submodules directly:

```hcl
module "compute_ec2_bastion" {
  source  = "daemonite-labs/compute/aws//modules/ec2-bastion"

  identifier = "compute-ec2-bastion"
  vpc_id     = "<VPC_ID>"
  subnet_id  = "<SUBNET_ID>"
}
```
