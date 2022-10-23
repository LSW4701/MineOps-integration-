locals {
  common_tags = {
    Project = "Network"
    Owner   = "posquit0" ## 
    
  private_subnet_tags = merge(var.private_subnet_tags)
  public_subnet_tags  = merge(var.public_subnet_tags)
  }

 
}

module "vpc" {
  source  = "tedilabs/network/aws//modules/vpc"
  version = "0.24.0"

  name                  = local.config.vpc.name
  cidr_block            = local.config.vpc.cidr

  internet_gateway_enabled = true

  dns_hostnames_enabled = true
  dns_support_enabled   = true

  tags = local.common_tags
  
  

}



##################################################
# Subnet Groups
##################################################

# module "subnet_group" {
#   source  = "tedilabs/network/aws//modules/subnet-group" 
#   version = "0.24.0"

#   for_each = local.config.subnet_groups

#   name                    = "${module.vpc.name}-${each.key}"
#   vpc_id                  = module.vpc.id
#   map_public_ip_on_launch = try(each.value.map_public_ip_on_launch, false)

#   subnets = {
#     for idx, subnet in try(each.value.subnets, []) :
#     "${module.vpc.name}-${each.key}-${format("%03d", idx + 1)}/${regex("az[0-9]", subnet.az_id)}" => {
#       cidr_block           = subnet.cidr
#       availability_zone_id = subnet.az_id
      
#     }
#   }
#   tags = local.common_tags
  
# }



module "subnet_group__public" {
  source  = "tedilabs/network/aws//modules/subnet-group"
  version = "0.24.0"
 
  name                    = "${module.vpc.name}-${each.key}"
  vpc_id                  = module.vpc.id
  map_public_ip_on_launch = true
 
  subnets = {
    "${module.vpc.name}-public-001/az1" = {
      cidr_block           = "10.222.0.0/24"
      availability_zone_id = "apne2-az1"
    }
    "${module.vpc.name}-public-002/az2" = {
      cidr_block           = "10.222.1.0/24"
      availability_zone_id = "apne2-az2"
    }
  }
 
  tags = {
    Project = "Network"
    Owner   = "posquit0" ## 
    #kubernetes.io/role/elb = "1"
  }
}

module "subnet_group__private" {
  source  = "tedilabs/network/aws//modules/subnet-group"
  version = "0.24.0"
 
  name                    = "${module.vpc.name}-private"
  vpc_id                  = module.vpc.id
  map_public_ip_on_launch = false
 
  subnets = {
    "${module.vpc.name}-private-001/az1" = {
      cidr_block           = "10.222.2.0/24"
      availability_zone_id = "apne2-az1"
    }
    "${module.vpc.name}-private-002/az2" = {
      cidr_block           = "10.222.3.0/24"
      availability_zone_id = "apne2-az2"
    }
  }
 
  tags = {}
}






###################################################
# Route Tables
###################################################

module "route_table__public" {
  source  = "tedilabs/network/aws//modules/route-table"
  version = "0.24.0"

  name   = "${module.vpc.name}-public"
  vpc_id = module.vpc.id

  subnets = module.subnet_group["public"].ids

  ipv4_routes = [
    {
      cidr_block = "0.0.0.0/0"
      gateway_id = module.vpc.internet_gateway_id
    },
  ]

  tags = local.common_tags
}

module "route_table__private" {
  source  = "tedilabs/network/aws//modules/route-table"
  version = "0.24.0"

  name   = "${module.vpc.name}-private"
  vpc_id = module.vpc.id

  subnets = module.subnet_group["private"].ids

  ipv4_routes = []

  tags = local.common_tags
}
