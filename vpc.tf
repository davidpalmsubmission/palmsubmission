resource "aws_security_group" "sg_ipfs_arn" {
  name        = "sg_ipfs_arn"
  description = "Allow IPFS inbound traffic"
  vpc_id      = aws_vpc.main.id

  dynamic "ingress" {
    for_each = var.sg_ingress_rules
    content {
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
      description = ingress.value.description
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    # assuming this as it was not stated in the assignment
  }

  tags = {
    Name = "ipfs security group"
  }
}

###
# to reconcile the security group that was created manually, you can run terraform import and then write the config block
# that matches the infra and then double check the plan - i generally avoid this because it gets messy with sg rules