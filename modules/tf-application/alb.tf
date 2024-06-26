resource "aws_lb" "load_balancer" {
  name               = "CloudnativeappTfLb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids
  drop_invalid_header_fields = true
  security_groups = [ aws_security_group.ecs_service_security_group.id ]

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "lb_target_group" {
  name     = "CloudnativeappTfLbTg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id
  target_type = "ip"

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "lb_listener" {
  load_balancer_arn = aws_lb.load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}
