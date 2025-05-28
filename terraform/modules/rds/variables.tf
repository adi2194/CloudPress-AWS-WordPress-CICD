variable "vpc_id" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "security_group_id" {
  type = string
}

variable "db_admin_user" {
  type = string
}

variable "db_admin_password" {
  type = string
}




variable "ec2_public_ip" {
  type = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS DB"
  type        = string
}
variable "db_engine" {
  description = "The database engine to use (e.g., mysql, postgres)"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the database engine to use"
  type        = string
}

