resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${var.aws_region}.s3"

  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint" "ecr_dkr_endpoint" {
  vpc_id              = data.aws_vpc.default.id
  service_name        = "com.amazonaws.${var.aws_region}.ecr.dkr"
  private_dns_enabled = true

  vpc_endpoint_type = "Interface"

  subnet_ids         = [ var.default_subnet_a_id, var.default_subnet_b_id ]

  security_group_ids = [ aws_security_group.ecr_dkr_sg.id ]
}

resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  vpc_id              = data.aws_vpc.default.id
  service_name        = "com.amazonaws.${var.aws_region}.ecr.api"
  private_dns_enabled = true

  vpc_endpoint_type = "Interface"

  subnet_ids         = [ var.default_subnet_a_id, var.default_subnet_b_id ]

  security_group_ids = [ aws_security_group.ecr_api_sg.id ]
}

resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${var.aws_region}.dynamodb"

  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint" "logs_endpoint" {
  vpc_id              = data.aws_vpc.default.id
  service_name        = "com.amazonaws.${var.aws_region}.logs"
  private_dns_enabled = true

  vpc_endpoint_type = "Interface"

  subnet_ids         = [ var.default_subnet_a_id, var.default_subnet_b_id ]

  security_group_ids = [ aws_security_group.logs_sg.id ]
}