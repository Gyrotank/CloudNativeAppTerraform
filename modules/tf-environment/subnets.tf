resource "aws_default_subnet" "default_subnet_a" {
  availability_zone = var.availability_zone_a_name
}

resource "aws_default_subnet" "default_subnet_b" {
  availability_zone = var.availability_zone_b_name
}