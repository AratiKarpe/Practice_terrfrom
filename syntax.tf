provider "aws" {
  region = "us-east-2"
  profile = "configs"
}


resource "aws_instance" "webserver" {
  ami                    = var.this_ami
  instance_type          = var.This_instance_type
  key_name               = "var.this_key_name"
  vpc_security_group_ids = [var.This_vpc_security_group_ids]
  count = var.this_count
  tags = {
    Name = "webserver"
  }
   disable_api_termination = var.this_disable_Api_termination
}
