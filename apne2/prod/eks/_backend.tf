terraform {

  
  backend "s3" {
    bucket = "lsw-bucket"             #   버켓명 
    key = "terra2/terraform.tfstate"  #  생성되는 폴더/파일명  
    region = "ap-northeast-2"
  }

  # backend "s3" {
  #   bucket = "devops-prod-tfbackend-s3"
  #   key    = "apne2/eks/mgt/terraform.tfstate"
  #   region = "ap-northeast-2"
  #   #    role_arn    = "{ASSUMED_ROLE}"
  #   max_retries = 3
  # }

  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0"
    }
  }
}
