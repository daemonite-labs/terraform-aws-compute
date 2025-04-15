# ec2-bastion

<!-- BEGIN_TF_DOCS -->

## Requirements

| Name      | Version |
| --------- | ------- |
| terraform | >=1.5.0 |
| aws       | >=5.0.0 |

## Providers

| Name | Version |
| ---- | ------- |
| aws  | >=5.0.0 |

## Modules

No modules.

## Resources

| Name                                                                                                                                                  | Type        |
| ----------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [aws_iam_instance_profile.bastion_instance_profile](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_instance_profile) | resource    |
| [aws_iam_role.bastion_role](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/iam_role)                                     | resource    |
| [aws_instance.bastion_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance)                                    | resource    |
| [aws_security_group.bastion](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group)                              | resource    |
| [aws_ami.amazon_linux](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami)                                            | data source |
| [aws_ebs_default_kms_key.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ebs_default_kms_key)                 | data source |
| [aws_kms_alias.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/kms_alias)                                     | data source |
| [aws_vpc.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/vpc)                                                    | data source |

## Inputs

| Name              | Description | Type           | Default                                               | Required |
| ----------------- | ----------- | -------------- | ----------------------------------------------------- | :------: |
| ec2_instance_type | n/a         | `string`       | `"t3.micro"`                                          |    no    |
| identifier        | n/a         | `string`       | n/a                                                   |   yes    |
| subnet_id         | n/a         | `string`       | n/a                                                   |   yes    |
| tags              | n/a         | `map(string)`  | `{}`                                                  |    no    |
| test_network_cidr | n/a         | `list(string)` | `[ "10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16" ]` |    no    |
| vpc_id            | n/a         | `string`       | n/a                                                   |   yes    |

## Outputs

No outputs.

<!-- END_TF_DOCS -->
