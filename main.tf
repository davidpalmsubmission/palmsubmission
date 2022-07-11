provider "aws" {
  region  = "eu-west-1"
  profile = var.aws_profile
  assume_role {
    role_arn = "arn:aws:iam::blabla:role/adminrole"
  }
}

terraform {
  backend "s3" {
    bucket         = "tf-state-palm"
    key            = "state/terraform.tfstate"
    region         = "eu-west-1"
    encrypt        = true
    dynamodb_table = "terraform-state"
  }
}

resource "aws_instance" "ipfs1" {

  ami                         = var.ami
  associate_public_ip_address = false
  instance_type               = var.instance_type
  key_name                    = var.keypair
  availability_zone           = var.az1a
  vpc_security_group_ids      = ["sg-ipfs"]
  subnet_id                   = "private-subnetid-1"

}

resource "aws_instance" "ipfs2" {

  ami                         = var.ami
  associate_public_ip_address = false
  instance_type               = var.instance_type
  key_name                    = var.keypair
  availability_zone           = var.az2b
  vpc_security_group_ids      = ["sg-ipfs-arn"]
  subnet_id                   = "private-subnetid-2"

}

resource "aws_instance" "ipfs3" {

  ami                         = var.ami
  associate_public_ip_address = false
  instance_type               = var.instance_type
  key_name                    = var.keypair
  availability_zone           = var.az3c
  vpc_security_group_ids      = ["sg-ipfs-arn"]
  subnet_id                   = "private-subnetid-3"

}

resource "aws_ebs_volume" "ipfs1" {
  availability_zone = "eu-west-1a"
  size              = 100
}

resource "aws_ebs_volume" "ipfs2" {
  availability_zone = "eu-west-1b"
  size              = 100
}

resource "aws_ebs_volume" "ipfs3" {
  availability_zone = "eu-west-1c"
  size              = 100
}

resource "aws_volume_attachment" "ebs_att1" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ipfs1.id
  instance_id = aws_instance.ipfs1.id
}

resource "aws_volume_attachment" "ebs_att2" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ipfs2.id
  instance_id = aws_instance.ipfs2.id
}

resource "aws_volume_attachment" "ebs_att3" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ipfs3.id
  instance_id = aws_instance.ipfs3.id
}