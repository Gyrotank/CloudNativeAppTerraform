resource "aws_lb" "lb" {
  name               = "CloudnativeappTfLb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.subnet_ids

  enable_deletion_protection = false
}

resource "aws_lb_target_group" "lb_target_group" {
  name     = "CloudnativeappTfLbTg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path = "/"
  }
}

resource "aws_lb_listener" "lb_listemer" {
  load_balancer_arn = aws_lb.lb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.lb_target_group.arn
  }
}