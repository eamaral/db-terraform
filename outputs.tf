output "rds_endpoint" {
  description = "Endpoint of the RDS"
  value       = aws_db_instance.fastfood_db.endpoint
}

output "rds_username" {
  description = "DB Username"
  value       = aws_db_instance.fastfood_db.username
}