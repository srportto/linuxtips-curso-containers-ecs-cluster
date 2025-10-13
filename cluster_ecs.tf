resource "aws_ecs_cluster" "main" {
  name = var.project_name

  setting {
    name  = "containerInsights" ### habilitando o container insights no cluster ECS, ele possibilita metricas e logs no cloudwatch para o cluster ECS
    value = "enabled"
  }
}