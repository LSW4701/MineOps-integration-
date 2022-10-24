terraform {
  backend "s3" {
    bucket      = "lsw-bk"
    key         = "apne2/ec2/jenkins/terraform.tfstate"
    region      = "ap-northeast-2"
    role_arn    = "arn:aws:iam::959714228357:role/terraformAsume"
    max_retries = 3
  }
}


