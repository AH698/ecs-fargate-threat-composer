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
