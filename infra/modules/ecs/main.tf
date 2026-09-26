resource "aws_ecs_cluster" "ecs-threat-composer" {
  name = var.cluster_name
}