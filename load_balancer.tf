resource "aws_security_group" "lb" {
  name   = format("%s-load-balancer", var.project_name)
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

resource "aws_security_group_rule" "ingress_80" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 80
  to_port           = 80
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
  description       = "liberando acesso na porta 80"
}

resource "aws_security_group_rule" "ingress_443" {
  cidr_blocks       = ["0.0.0.0/0"]
  from_port         = 443
  to_port           = 443
  protocol          = "tcp"
  security_group_id = aws_security_group.lb.id
  type              = "ingress"
  description       = "liberando acesso na porta 443"

}

resource "aws_lb" "main" {
  name               = format("%s-ingress", var.project_name)
  internal           = var.load_balancer_internal
  load_balancer_type = var.load_balancer_type

  subnets = [
    data.aws_ssm_parameter.subnet_public_1a.value,
    data.aws_ssm_parameter.subnet_public_1b.value,
    data.aws_ssm_parameter.subnet_public_1c.value
  ]

  security_groups = [aws_security_group.lb.id]

  enable_deletion_protection       = false
  enable_cross_zone_load_balancing = false
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"
  default_action {
    type = "fixed-response"
    fixed_response {
      content_type = "text/plain"
      message_body = "OK - LinuxTips"
      status_code  = "200"
    }
  }
}


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