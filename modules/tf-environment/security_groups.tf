resource "aws_security_group" "ecr_dkr_sg" {
  description = "ECR DKR Security group"

  vpc_id = data.aws_vpc.default.id

  ingress {
    description = "allow all ingress traffic from subnets"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ data.aws_vpc.default.cidr_block ]
  }

  egress {
    description = "allow all egress traffic"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
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
    cidr_blocks = [ data.aws_vpc.default.cidr_block ]
  }

  egress {
    description = "allow all egress traffic"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
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
    cidr_blocks = [ data.aws_vpc.default.cidr_block ]
  }

  egress {
    description = "allow all egress traffic"
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = [ "0.0.0.0/0" ]
  }
}
