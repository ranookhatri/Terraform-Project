# # Getting RDS Endpoint
# output "rds_db_endpoint" {
#   value = aws_db_instance.rds.endpoint
# }

# Application Load Balancer ARN
output "alb_arn" {
  value = aws_lb.external-alb.arn
}

# Application Load Balancer ID
output "alb_id" {
  value = aws_lb.external-alb.id
}


# Application Load Balancer ID
output "alb_dnsname" {
  value = aws_lb.external-alb.dns_name
}