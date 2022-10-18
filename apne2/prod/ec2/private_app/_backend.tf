terraform {

  
   backend "s3" {
    bucket = "lsw-bk"             #   버켓명 
    key = "apne2/ec2/private_app/terraform.tfstate" #  생성되는 폴더/파일명  
    role_arn    = "arn:aws:iam::959714228357:role/terraformAsume"
    region = "ap-northeast-2"
  }


}
