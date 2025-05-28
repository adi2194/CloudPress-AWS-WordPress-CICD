output "rds_endpoint" {
  value = replace(aws_db_instance.wordpress_db.endpoint, ":3306", "")
}
