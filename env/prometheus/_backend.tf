
terraform {
  backend "local" {
  }
}


###################################################
# Local Variables
###################################################

locals {
  context = yamldecode(file(var.config_file)).context
  config  = yamldecode(templatefile(var.config_file, local.context))
}


###################################################
# Providers
###################################################

provider "aws" {
  region = "ap-northeast-2"
}



## terraform {
#   backend "s3" {
#     bucket      = "lsw-bk"
#     key         = "apne2/ec2/prometheus/terraform.tfstate"
#     region      = "ap-northeast-2"
# #    role_arn    = "{ASSUMED_ROLE}"
#     max_retries = 3
#   }

  
# }
