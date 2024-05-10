resource "aws_vpc_endpoint" "s3_endpoint" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.s3"

  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint" "ecr_dkr_endpoint" {
  vpc_id              = data.aws_vpc.default.id
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.dkr"
  private_dns_enabled = true

  vpc_endpoint_type = "Interface"

  subnet_ids         = [ aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id ]

  security_group_ids = [ aws_security_group.ecr_dkr_sg.id ]
}

resource "aws_vpc_endpoint" "ecr_api_endpoint" {
  vpc_id              = data.aws_vpc.default.id
  service_name        = "com.amazonaws.${data.aws_region.current.name}.ecr.api"
  private_dns_enabled = true

  vpc_endpoint_type = "Interface"

  subnet_ids         = [ aws_default_subnet.default_subnet_a.id, aws_default_subnet.default_subnet_b.id ]

  security_group_ids = [ aws_security_group.ecr_api_sg.id ]
}

resource "aws_vpc_endpoint" "dynamodb_endpoint" {
  vpc_id       = data.aws_vpc.default.id
  service_name = "com.amazonaws.${data.aws_region.current.name}.dynamodb"

  vpc_endpoint_type = "Gateway"
}

resource "aws_vpc_endpoint" "logs_endpoint" {
  vpc_id              = data.aws_vpc.default.id
  service_name        = "com.amazonaws.${data.aws_region.current.name}.logs"
  private_dns_enabled = true

  vpc_endpoint_type = "Interface"

  subnet_ids         = [ "subnet-0e2759092403c537c", "subnet-01da444623a60d536" ]

  security_group_ids = [ aws_security_group.logs_sg.id ]
}