output "selected_azs" {
  value       = random_shuffle.az.result
  description = "The randomly selected azs for deployment"
}

output "public_subnet_cidr" {
  value       = local.public_subnets
  description = "The public subnet_cidr"
}

output "private_subnet_cidr" {
  value       = local.private_subnets
  description = "The private subnet_cidr"
}

# Reference the ARN
output "lb_arn" {
  value = aws_lb.frontend.arn
}

output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer"
  value       = aws_lb.frontend.dns_name
}

output "aws_instance_public_frontend_0" {
  value = aws_instance.frontend[0].public_ip # Returns a list of IPs
}

output "aws_instance_public_frontend_1" {
  value = aws_instance.frontend[1].public_ip # Returns a list of IPs
}

output "alb_zone_id" {
  description = "Zone ID of the load balancer (for Route 53 alias records)"
  value       = aws_lb.frontend.zone_id
}



output "https_listener_arn" {
  description = "ARN of the HTTPS listener"
  value       = aws_lb_listener.frontend_https.arn
}
