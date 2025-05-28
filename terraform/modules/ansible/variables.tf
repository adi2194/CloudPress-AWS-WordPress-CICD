
variable "ec2_public_ip" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "ansible_dir" {
  type = string
  
}

variable "db_admin_user" {
  type = string
}

variable "db_admin_password" {
  type = string
}

variable "wp_db_name" {
  type = string
}

variable "wp_db_user" {
  type = string
}

variable "wp_db_password" {
  type = string
}

variable "wp_site_title" {
  type = string
}

variable "wp_admin_user" {
  type = string
}

variable "wp_admin_password" {
  type = string
}

variable "wp_admin_email" {
  type = string
}

variable "rds_endpoint" {
  description = "The RDS endpoint without the port"
  type        = string
}




