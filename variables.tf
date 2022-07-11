variable "ami_id" {
    type = string
    default = "ami-abcd1234"
    description = "AMI ID for EC2 instance"
}

variable "instance_type" {
    type = string
    default = "t2.medium"
    description = "Instance type"
}

variable "var_keypair" {
    description = "Keypair for connecting to EC2 instance"
}

variable "az1a" {
  description = "AZ to create the instance in"
  type        = string   
}

variable "az2b" {
  description = "AZ to create the instance in"
  type        = string   
}

variable "az3c" {
  description = "AZ to create the instance in"
  type        = string   
}

variable "sg_ingress_rules" {
  description = "Ingress security group rules"
  type        = map(any)
}