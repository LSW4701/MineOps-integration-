#!/bin/bash 
#: Title   :MineOps EKS create script
#: Date :2022-10-20
#: Author : LSW <pro_4701@naver.com>
#: Version  : 1.1
#: Description : : Hi

echo "============================================"
echo " create MineOps EKS create script  "
echo " module.cluster.aws_eks_cluster.this: Still creating... [10m50s elapsed] "
echo " EKS 리소스 생성과정에서 10분 이상 시간 소모 "
date +%Y-%m-%d

echo " 스크립트 실행전 초기화 "


DIR="$( cd "$( dirname "$0" )" && pwd -P )"
echo $DIR

cd $DIR/env/terraform-aws-ubuntu/network ; 
rm -rf .terraform .terraform.lock.hcl

cd $DIR/env/ec2/ec2-instance ; 
rm -rf .terraform .terraform.lock.hcl

cd $DIR/env/terraform-eks/3-irsa ; 
rm -rf .terraform .terraform.lock.hcl