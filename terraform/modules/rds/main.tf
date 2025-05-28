resource "aws_db_subnet_group" "default" {
  name       = "rds-subnet-group"
  subnet_ids = var.private_subnet_ids
}

resource "aws_db_instance" "wordpress_db" {
  identifier             = "wordpress-db"
  engine                 = var.db_engine
  engine_version         = var.db_engine_version
  instance_class         = var.db_instance_class   
  allocated_storage      = 20
 
  username               = var.db_admin_user
  password               = var.db_admin_password
  db_subnet_group_name   = aws_db_subnet_group.default.name
  vpc_security_group_ids = [var.security_group_id]
  skip_final_snapshot    = true
}
 