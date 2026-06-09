provider "aws" {
  region = "us-east-1"
  profile = "configs"
  access_key = "my-access_key"
  secrete_key = "my-secrete_key"
}

resource "aws_instance" "webserver"{
  key_name =
  ami =
  instance_type =
  vpc_security_group_ids =
  disable_api_termination =
  tags ={
    Name = "webserver"
  }
}

aws configure --profile=configs
