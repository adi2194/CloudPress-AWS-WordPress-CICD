variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
}

variable "vpc_cidr_block" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "key_name" {
  description = "Name of the SSH key pair"
  type        = string
}

variable "private_key_path" {
  description = "Path to the private key file"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

# WordPress + RDS Variables
variable "db_admin_user" {
  description = "Admin username for RDS"
  type        = string
}

variable "db_admin_password" {
  description = "Admin password for RDS"
  type        = string
  sensitive   = true
}

variable "wp_db_name" {
  description = "WordPress DB name"
  type        = string
}

variable "wp_db_user" {
  description = "WordPress DB user"
  type        = string
}

variable "wp_db_password" {
  description = "WordPress DB password"
  type        = string
  sensitive   = true
}

variable "wp_site_title" {
  description = "WordPress site title"
  type        = string
}

variable "wp_admin_user" {
  description = "WordPress admin username"
  type        = string
}

variable "wp_admin_password" {
  description = "WordPress admin password"
  type        = string
  sensitive   = true
}

variable "wp_admin_email" {
  description = "WordPress admin email"
  type        = string
}

variable "db_instance_class" {
  description = "The instance class for the RDS DB"
  type        = string
}

variable "db_engine" {
  description = "The database engine"
  type        = string
}

variable "db_engine_version" {
  description = "The version of the DB engine"
  type        = string
}

variable "ansible_dir" {
  type = string
  
}

