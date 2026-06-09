provider "aws" {
  region = "us-east-1"
  profile = "configs"
}

resource "aws_instance" "webserver"{
  key_name = "sample"
  ami = "ami-0c6ac5f2fed2981b0 "
  instance_type = "t3.micro "
  vpc_security_group_ids =["sg-051c13ca487ff9c4f"]
 
  tags ={
    Name = "webserver"
  }
}
#disable_api_termination = ""
#aws configure --profile=configs
