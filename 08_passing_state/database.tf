resource "aws_db_instance" "postgresdb" {
  allocated_storage    = 10
  engine               = "postgres"
  engine_version       = "13.3"
  instance_class       = "db.t3.micro"
  name                 = "postgres${random_integer.int.result}"
  username             = var.username
  password             = var.password
  parameter_group_name = aws_db_parameter_group.education.name
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "education" {
  name   = "education${random_integer.int.result}"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}

resource "random_integer" "int" {
  min = 0
  max = 1000
}