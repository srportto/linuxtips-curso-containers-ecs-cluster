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


### ECS geral configs ###
nodes_ami          = "ami-0efb059385a6bb760" # Amazon Linux 2 ECS Optimized AMI (HVM), SSD Volume Type - us-west-2
node_instance_type = "t3.micro"
node_volume_size   = 50    # em GB
node_volume_type   = "gp2" # gp2, gp3, io1, st1, sc1, standard

cluster_on_demand_min_size = 2

cluster_on_demand_max_size = 4

cluster_on_demand_desired_size = 3