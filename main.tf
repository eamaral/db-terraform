# main.tf
provider "aws" {
  region = var.region
}

resource "aws_db_subnet_group" "fastfood" {
  name       = "fastfood-db-subnet-group"
  subnet_ids = var.private_subnets
  description = "Subnet group for Fastfood RDS in private subnets"
}

resource "aws_security_group" "fastfood_db_sg" {
  name   = "fastfood-db-sg"
  vpc_id = var.vpc_id

  ingress {
    from_port       = 3306
    to_port         = 3306
    protocol        = "tcp"
    security_groups = [var.ecs_service_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_db_instance" "fastfood_db" {
  identifier         = "fastfood-db"
  allocated_storage  = 20
  engine             = "mysql"
  engine_version     = "8.0"
  instance_class     = "db.t3.micro"
  db_name               = "fastfood"
  username           = var.db_username
  password           = var.db_password
  db_subnet_group_name = aws_db_subnet_group.fastfood.name
  vpc_security_group_ids = [aws_security_group.fastfood_db_sg.id]
  skip_final_snapshot   = true
  publicly_accessible   = false
  multi_az              = false
  storage_encrypted     = false
  backup_retention_period = 0
}
