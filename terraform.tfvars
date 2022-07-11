instance_type = "t2.medium"

ami_id = "ami-abcd1234"

var_keypair = "ipfs-keypair-name"

az1a = "us-east-1a"

az2b = "us-east-1b"

az3c = "us-east-1c"

sg_ingress_rules = {
  "1" = {
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #usually defined CIDR block from VPC
    description = "HTTP"
  },
  "2" = {
    from_port   = 4001
    to_port     = 4001
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #usually defined CIDR block from VPC
    description = "IPFS"
  },
  "3" = {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #usually defined CIDR block from VPC
    description = "SSH"
  }
}