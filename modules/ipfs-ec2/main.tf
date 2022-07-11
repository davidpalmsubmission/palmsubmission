resource "aws_instance" "ipfs" {
    ami = var.ami
    associate_public_ip_address = false
    instance_type               = var.instance_type
    key_name                    = var.keypair
    availability_zone           = var.availability_zone
    vpc_security_group_ids      = var.vpc_security_group_ids
    subnet_id                   = var.subnet_id
}

resource "aws_ebs_volume" "ipfs" {
  availability_zone = var.availability_zone
  size              = 100
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ipfs.id
  instance_id = aws_instance.ipfs.id
}