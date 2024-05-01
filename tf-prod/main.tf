module "prod_s3_bucket" {
  source      = "../modules/tf-environment"
  bucket_name = var.prod_bucket_name
}