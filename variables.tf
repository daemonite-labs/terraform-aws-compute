variable "ec2_bastion" {
  type = object({
    tags              = optional(map(string), {})
    identifier        = string
    ec2_instance_type = optional(string, "t3.micro")
    vpc_id            = string
    subnet_id         = string
    test_network_cidr = optional(list(string), ["10.0.0.0/8", "172.16.0.0/12", "192.168.0.0/16"])
  })
  default = null
}
