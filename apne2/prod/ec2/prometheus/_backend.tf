terraform {
  backend "s3" {
    bucket      = "lsw-bk"
    key         = "apne2/ec2/prometheus/terraform.tfstate"
    region      = "ap-northeast-2"
#    role_arn    = "{ASSUMED_ROLE}"
    max_retries = 3
  }

  
}
