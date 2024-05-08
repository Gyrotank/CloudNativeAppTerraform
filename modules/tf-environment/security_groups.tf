resource "aws_security_group" "ecr_dkr_sg" {
  description = "ECR DKR Security group"

  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "allow all ingress traffic from subnets"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ for subnet in data.aws_subnet.default_subnets_cidr_blocks : subnet.cidr_block ]
  }
}

resource "aws_security_group" "ecr_api_sg" {
  description = "ECR API Security group"

  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "allow all ingress traffic from subnets"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ for subnet in data.aws_subnet.default_subnets_cidr_blocks : subnet.cidr_block ]
  }
}

resource "aws_security_group" "logs_sg" {
  description = "Logs Security group"

  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "allow all ingress traffic from subnets"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ for subnet in data.aws_subnet.default_subnets_cidr_blocks : subnet.cidr_block ]
  }
}
