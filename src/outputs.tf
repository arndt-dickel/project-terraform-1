output "load_balancer_dns" {
  value       = aws_lb.appl_load_bal.dns_name
  description = "The DNS name of the Application Load Balancer"
}

output "autoscaling_group_name" {
  value       = aws_autoscaling_group.auto_scaler.name
  description = "The name of the Auto Scaling group"
}

output "vpc_id" {
  value       = aws_vpc.project_vpc.id
  description = "The ID of the VPC"
}

output "public_subnet_ids" {
  value       = [aws_subnet.public_subnet_1.id, aws_subnet.public_subnet_2.id]
  description = "The IDs of the public subnets"
}

output "private_subnet_ids" {
  value       = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  description = "The IDs of the private subnets"
}