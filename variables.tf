variable "region" {
  description = "Região da AWS"
  type        = string
}

variable "vpc_id" {
  description = "ID da VPC onde o banco será criado"
  type        = string
}

variable "private_subnets" {
  description = "Subnets privadas para o RDS"
  type        = list(string)
}

variable "ecs_service_sg_id" {
  description = "Security group do ECS que acessará o banco"
  type        = string
}

variable "db_username" {
  description = "Usuário do banco"
  type        = string
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
}