terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.61.0"
    }
  }
}

provider "aws" {
  
  region = "us-east-1"
}
/*
resource "aws_iam_group" "gp1" {
    name = "manager24"
   # prevent_destroy = false  #metarguent to prevent destroyn answer 
  
}

resource "aws_iam_user" "usr1" {
  name = "hkrd4ever"
  depends_on = [aws_iam_group.gp1]
}
*/

resource "aws_instance" "server1" {
    ami = "ami-033a1ebf088e56e81"
    instance_type = "t3.small"
    key_name = "week12"
  
}
resource "null_resource" "n1" {
  connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file(week12.pem)
        host = aws_instance.demo1.public_ip
        
    
  }
  
}
