resource "aws_db_instance" "postgres" {
  allocated_storage = 20
  engine = "postgres"
  instance_class = "db.t3.micro"
  db_name = "mini_pastebin_db"
  username = "myuser"
  password = "mypassword"
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subnet_group.name
  skip_final_snapshot = true
}

resource "aws_db_subnet_group" "rds_subnet_group" {
  name = "rds-subnet-group"
  subnet_ids = flatten(var.subnet_ids)
}

resource "aws_security_group" "rds_sg" {
  vpc_id = var.vpc_id
}


