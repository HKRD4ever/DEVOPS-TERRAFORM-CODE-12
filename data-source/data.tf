# these data below will pull inform on AWS like AMI and imprt them
data "aws_ami" "ami1" {
  most_recent      = true
  owners           = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*-x86_64-ebs"]
  }

  filter {
    name   = "root-device-type"
    values = ["ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}
data "aws_instance" "ec21" {
  instance_id = "i-04cfb4825061b453f"
}

/* create an ec2 with the data above imported from AWS
#resource "aws_instance" "name1" {
    ami = data.aws_ami.example.id
  
}*/
