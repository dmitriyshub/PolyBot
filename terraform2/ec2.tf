

resource "aws_instance" "my_Amazon_linux" {
  # count                  = var.prefix
  #  ami                         = "ami-0a1ee2fb28fe05df3" #Amazon Linux AMI
  ami                         = "ami-06402f02caa521327" # My Amazon Linux AMI
  instance_type               = "t2.micro"
  vpc_security_group_ids      = [aws_security_group.EX1_polybot-secure-group.id]
  subnet_id                   = aws_subnet.public-subnet-2b.id
  associate_public_ip_address = true
  key_name                    = "alexeymihaylov_key"
  user_data                   = <<EOF
#! /bin/bash
docker run  --env-file  /home/ec2-user/app/.envfile  -d -v /home/ec2-user/app/:/.secret  352708296901.dkr.ecr.eu-central-1.amazonaws.com/alexeyimapolybot:latest
aws autoscaling put-scaling-policy --policy-name sqs10-target-tracking-scaling-policy   --auto-scaling-group-name Alexey_Dima_polybot-autoscaling-group  --policy-type TargetTrackingScaling   --target-tracking-configuration file://D:\elements\project\PolyBot\Config2.json
EOF
  #  user_data                   = base64encode(data.template_file.file.rendered)

  depends_on = [aws_vpc.vpc, aws_autoscaling_group.Polybot-aws_autoscaling_group]
  tags = {
    Name        = "${var.project_name} -client"
    environment = "tf"
  }
}

#data "template_file" "file" {
#  template = file("myscript.sh")
#}
