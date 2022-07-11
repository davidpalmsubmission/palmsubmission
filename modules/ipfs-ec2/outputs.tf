output "ec2_id" {
  description = "The ID of the instance"
  value       = module.ipfs-ec2.id
}

output "ec2_arn" {
  description = "The ARN of the instance"
  value       = module.ipfs-ec2.arn
}

output "ec2_private_dns" {
  description = "The private DNS name assigned to the instance. Can only be used inside the Amazon EC2, and only available if you've enabled DNS hostnames for your VPC"
  value       = module.ipfs-ec2.private_dns
}