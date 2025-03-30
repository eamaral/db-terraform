output "rds_endpoint" {
  description = "Endpoint do RDS sem porta"
  value       = split(":", aws_db_instance.fastfood_db.endpoint)[0]
}

output "rds_username" {
  description = "DB Username"
  value       = aws_db_instance.fastfood_db.username
}