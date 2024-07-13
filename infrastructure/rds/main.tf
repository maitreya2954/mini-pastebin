resource "aws_db_instance" "postgres" {
  allocated_storage = 20
  engine = "postgres"
  engine_version = "12.20-R1"
  instance_class = "db.t3.micro"
  db_name = "mini_pastebin_db"
  username = "admin"
  password = "yourpassword"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-subnet-group"
  subnet_ids = var.subnet_ids
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
}


