provider "aws" {
  region                  = "eu-west-1"
  profile                 = "terraform_workshop"
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}" 
}