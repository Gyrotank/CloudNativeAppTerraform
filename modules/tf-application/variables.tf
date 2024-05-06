variable "s3_bucket_name" {
  type = string
}

variable "dynamodb_name" {
  type = string
}

variable "subnet_ids" {
  type = list(string)
}

variable "vpc_id" {
  type = string
}

variable "region_name" {
  type = string
}

variable "ami_url" {
  type = string
}
