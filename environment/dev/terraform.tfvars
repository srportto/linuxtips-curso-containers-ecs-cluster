project_name = "linuxtips-ecs-cluster"
region       = "us-west-2"

##### Preenche as variaveis abaixo com o caminhos do SSM parametros , que serao udados pelo modulo data.tf para carregar os valores e usar  na criacao da infra  nesse repo de terraform#####

ssm_vpc_id = "/linuxtips-vpc/vpc/vpc_id"

ssm_public_subnet_1 = "/linuxtips-vpc/vpc/subnet_public_1a"
ssm_public_subnet_2 = "/linuxtips-vpc/vpc/subnet_public_1b"
ssm_public_subnet_3 = "/linuxtips-vpc/vpc/subnet_public_1c"

ssm_private_subnet_1 = "/linuxtips-vpc/vpc/subnet_private_1a"
ssm_private_subnet_2 = "/linuxtips-vpc/vpc/subnet_private_1b"
ssm_private_subnet_3 = "/linuxtips-vpc/vpc/subnet_private_1c"

#### Variaveis para criacao do loader balancer ####
load_balancer_internal = false
load_balancer_type     = "application"

