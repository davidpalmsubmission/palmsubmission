variable "ami" {
    type = string
    default = "ami-abcd1234"
    description = "AMI ID for EC2 instance"
}

variable "instance_type" {
    type = string
    default = "t2.medium"
    description = "Instance type"
}

variable "keypair" {
    description = "Keypair for connecting to EC2 instance"
}

variable "availability_zone" {
  description = "AZ to create the instance in"
  type        = string   
}

variable "subnet_id" {
  description = "The VPC Subnet ID to create the instance in"
  type        = string
}

variable "vpc_security_group_ids" {
  description = "A list of security group IDs to associate with"
  type        = list(string)
}