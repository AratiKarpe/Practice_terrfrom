provider "aws" {
  region = "us-east-2"
  profile = "default"
}

resource "aws_instance" "webserver"{
  key_name = "sample"
  ami = "ami-0c6ac5f2fed2981b0 "
  instance_type = "t2.micro "
  vpc_security_group_ids =["sg-051c13ca487ff9c4f"]
 
  tags ={
    Name = "Webserver"
  }
}
#disable_api_termination = ""
#aws configure --profile=configs
