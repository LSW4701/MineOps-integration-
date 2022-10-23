output "vpc" {
  value = module.vpc
}

output "subnet_groups" {
  value = module.subnet_group__public
}

# output "subnet_groups" {
#   value = module.subnet_group
# }
