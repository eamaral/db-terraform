variable "region" {
  description = "Região da AWS"
  type        = string
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "ID da VPC onde o banco será criado"
  type        = string
  default     = ""
}

variable "private_subnets" {
  description = "Subnets privadas para o RDS"
  type        = list(string)
  default     = []
}

variable "ecs_service_sg_id" {
  description = "Security group do ECS que acessará o banco"
  type        = string
  default     = ""
}

variable "db_username" {
  description = "Usuário do banco"
  type        = string
  default     = "admin"
}

variable "db_password" {
  description = "Senha do banco"
  type        = string
  default     = "Senha123"
}