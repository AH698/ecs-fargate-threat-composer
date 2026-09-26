resource "aws_lb" "alb" {
  name               = var.alb_name
  internal           = var.internal
  load_balancer_type = "application"
  security_groups    = [aws_security_group.sg_alb.id]
  subnets            = var.public_subnets_id
}

resource "aws_security_group" "sg_alb" {
  name = var.sg_alb
  vpc_id = var.vpc_id

  ingress {
    from_port        = var.http
    to_port          = var.http
    protocol         = var.transport_layer
    cidr_blocks      = var.ingress_cidr
  }  

  ingress {
    from_port        = var.https
    to_port          = var.https
    protocol         = var.transport_layer
    cidr_blocks      = var.ingress_cidr
  }  

  egress {
    from_port        = var.egress
    to_port          = var.egress
    protocol         = var.egress_protocol
    cidr_blocks      = var.egress_cidr
  }
}

