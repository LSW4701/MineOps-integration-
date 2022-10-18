terraform {
 

  

   backend "s3" {
    bucket = "lsw-bk"             #   버켓명 
    key = "apne2/network/vpc/terraform.tfstate"  #  생성되는 폴더/파일명  
    role_arn    = "arn:aws:iam::959714228357:role/terraformAsume"
    region = "ap-northeast-2"
  }



#   backend "s3" {
#     bucket      = "devops-prod-tfbackend-s3"
#     key         = "apne2/network/vpc/terraform.tfstate"
#     region      = "ap-northeast-2"
# #    role_arn    = "{ASSUMED_ROLE}"
#     max_retries = 3          # 최대 재 시도 값
#   }
}


