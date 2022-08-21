#!/bin/bash
set -ex
sudo yum update -y
sudo amazon-linux-extras install docker -y
sudo service docker start
sudo usermod -a -G docker ec2-user
sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

sudo yum install  python37
pip3 install  boto3

mkdir app
cd app
aws s3 cp s3://ex1-polybot-bucket/data/.envfile  .envfile
aws s3 cp s3://ex1-polybot-bucket/data/.telegramToken  .telegramToken

docker pull 352708296901.dkr.ecr.eu-central-1.amazonaws.com/ex1-polybot-ecr:worker


