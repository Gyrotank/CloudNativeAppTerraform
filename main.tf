provider "aws" {
  profile = "default"
  region  = "eu-west-1"
}

module "dev_s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.dev_bucket_name
}

module "qa_s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.qa_bucket_name
}

module "prod_s3_bucket" {
  source      = "./modules/s3_bucket"
  bucket_name = var.prod_bucket_name
}