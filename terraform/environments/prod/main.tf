terraform {

  backend "s3" {
    bucket         = "self-healing-terraform-state"
    key            = "prod/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-lock-table"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "infrastructure" {

  source = "../../"

  environment = "prod"
}