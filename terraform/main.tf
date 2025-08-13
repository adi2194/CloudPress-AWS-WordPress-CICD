provider "aws" {
  region = var.aws_region
  
}

module "vpc" {
  source     = "./modules/vpc"
  cidr_block = var.vpc_cidr_block
}

module "security-grp" {
  source = "./modules/security-grp"
  vpc_id = module.vpc.vpc_id
}

module "keypair" {
  source           = "./modules/keypair"
  key_name         = var.key_name
  private_key_path = var.private_key_path
}

module "ec2" {
  source              = "./modules/ec2"
  ami                 = var.ami
  instance_type       = var.instance_type
  subnet_id           = module.vpc.public_subnet_1_id
  key_name            = module.keypair.key_name
  security_group_ids  = [module.security-grp.ec2_sg_id]
}

module "rds" {
  source             = "./modules/rds"
  vpc_id             = module.vpc.vpc_id
  db_engine          = var.db_engine
  db_engine_version  = var.db_engine_version
  db_instance_class  = var.db_instance_class 

  private_subnet_ids = [
    module.vpc.private_subnet_1_id,
    module.vpc.private_subnet_2_id
  ]

  security_group_id  = module.security-grp.rds_sg_id
  db_admin_user      = var.db_admin_user
  db_admin_password  = var.db_admin_password
  ec2_public_ip      = module.ec2.public_ip
}


resource "aws_s3_bucket" "s3_bucket" {
  bucket = "aditya-tf-state-file-bucket"
}


resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-lock"
  billing_mode = "PAY_PER_REQUEST" # No capacity planning needed
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  
}


