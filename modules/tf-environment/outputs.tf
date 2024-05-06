output "s3_bucket_name" {
  value = aws_s3_bucket.s3_bucket_cloudnativeapp-tf.bucket
}

output "dynamodb_name" {
  value = aws_dynamodb_table.dynamodb_table_cloudnativeapp-tf.name
}

output "default_subnet_ids" {
  value = [ var.default_subnet_a_id, var.default_subnet_b_id ]
}

output "default_vpc_id" {
  value = data.aws_vpc.default.id
}

output "default_region_name" {
  value = data.aws_region.current.name
}
