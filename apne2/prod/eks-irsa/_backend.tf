terraform {
  backend "s3" {
    bucket = "lsw-bk"
    key    = "apne2/eks-irsa/terraform.tfstate"
    region = "ap-northeast-2"
    #    role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
  }
}



