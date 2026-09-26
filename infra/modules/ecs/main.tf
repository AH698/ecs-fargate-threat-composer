resource "aws_ecs_cluster" "ecs-threat-composer" {
  name = var.cluster_name
}

resource "aws_iam_role" "ecs_task_execution_iam" {
  name = var.ecs_iam_execution_name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = var.iam_role_effect
        Sid    = ""
        Principal = {
          Service = "ecs-tasks.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy_attachment" "iam_policy" {
  role       = aws_iam_role.ecs_task_execution_iam.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonECSTaskExecutionRolePolicy"
}

resource "aws_security_group" "ecs_sg" {
  name   = var.ecs_sg_name
  vpc_id = var.vpc_id

  ingress {
    from_port   = var.container_port
    to_port     = var.container_port
    protocol    =  var.ecs_sg_ingress_protocol
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = var.ecs_sg_egress
    to_port     = var.ecs_sg_egress
    protocol    = var.ecs_sg_egress_protocol
    cidr_blocks = var.cidr_blocks_egress
  }
}