resource "aws_ssm_parameter" "lb_arn" {

  name  = "/linuxtips/ecs/lb/id"
  type  = "String"
  value = aws_lb.main.arn
  tags = {
    Project = var.project_name
  }

}


resource "aws_ssm_parameter" "lb_listener" {

  name  = "/linuxtips/ecs/lb/listener"
  type  = "String"
  value = aws_lb_listener.main.arn
  tags = {
    Project = var.project_name
  }

}