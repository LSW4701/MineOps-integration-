output "vpc" {
  value = module.vpc
}

output "subnet_group__public" {
  value = module.subnet_group__public
}

# output "subnet_groups" {
#   value = module.subnet_group
# }
