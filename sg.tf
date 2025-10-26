### segundo security group para liberar o acesso do load balancer para o cluster ECS
resource "aws_security_group" "main" {
  name   = format("%s", var.project_name)
  vpc_id = data.aws_ssm_parameter.vpc.value

  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}


resource "aws_security_group_rule" "subnet_ranges" {
  from_port         = 0
  to_port           = 0
  description       = "liberando todo o trafego para vpc"
  security_group_id = aws_security_group.main.id
  cidr_blocks       = ["10.0.0.0/16"]
  protocol          = "-1"
  type              = "ingress"

}