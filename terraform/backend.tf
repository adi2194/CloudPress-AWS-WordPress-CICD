terraform {
  backend "s3" {
    bucket         = "aditya-tf-state-file-bucket"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock"
    encrypt        = true
  }
}
