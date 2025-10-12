#### General configs ####
variable "project_name" {}
variable "region" {}


##### SSM parametros que vamos pegar da infra de rede criado por outro modulo e armazenado no SSM #####
variable "ssm_vpc_id" {}

variable "ssm_public_subnet_1" {}
variable "ssm_public_subnet_2" {}
variable "ssm_public_subnet_3" {}

variable "ssm_private_subnet_1" {}
variable "ssm_private_subnet_2" {}
variable "ssm_private_subnet_3" {}


#### Variaveis para criacao do loader balancer ####
variable "load_balancer_internal" {}
variable "load_balancer_type" {}

