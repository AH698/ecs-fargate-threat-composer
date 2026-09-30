resource "aws_lb" "alb" {
  name                       = var.alb_name
  internal                   = var.internal
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.sg_alb.id]
  subnets                    = var.public_subnets_id
  drop_invalid_header_fields = true
}

resource "aws_security_group" "sg_alb" {
  name   = var.sg_alb
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.http
    to_port     = var.http
    protocol    = var.transport_layer
    cidr_blocks = var.ingress_cidr
  }

  ingress {
    from_port   = var.https
    to_port     = var.https
    protocol    = var.transport_layer
    cidr_blocks = var.ingress_cidr
  }

  egress {
    from_port   = var.egress
    to_port     = var.egress
    protocol    = var.egress_protocol
    cidr_blocks = var.egress_cidr
  }
}

resource "aws_lb_target_group" "ip-tg" {
  name        = var.tg_name
  port        = var.tg_port
  protocol    = var.tg_protocol
  target_type = "ip"
  vpc_id      = var.vpc_id

  health_check {
    path                = var.hc_tg_path
    port                = var.tg_port
    protocol            = var.tg_protocol
    matcher             = var.hc_tg_matcher
    interval            = var.hc_tg_interval
    timeout             = var.hc_tg_timeout
    healthy_threshold   = var.hc_tg_healthy_threshold
    unhealthy_threshold = var.hc_tg_unhealthy_threshold
  }
}

resource "aws_lb_listener" "listener_1" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.https
  protocol          = var.alb_listener_1_protocol
  ssl_policy        = "ELBSecurityPolicy-TLS13-1-2-2021-06"
  certificate_arn   = var.cert_arn

  default_action {
    type             = var.alb_listener_1_type
    target_group_arn = aws_lb_target_group.ip-tg.arn
  }
}

resource "aws_lb_listener" "listener_2" {
  load_balancer_arn = aws_lb.alb.arn
  port              = var.http
  protocol          = var.alb_listener_2_protocol

  default_action {
    type = "redirect"

    redirect {
      port        = var.https
      protocol    = var.alb_listener_1_protocol
      status_code = var.alb_listener_2_status_code
    }
  }
}