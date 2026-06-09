provider "aws" {
  region  = "us-east-2"
  profile = "default"
}

resource "aws_instance" "webserver" {
  ami                    = "ami-0c6ac5f2fed2981b0"
  instance_type          = "t2.micro"
  key_name               = "sample"
  vpc_security_group_ids = ["sg-051c13ca487ff9c4f"]

  tags = {
    Name = "Webserver"
  }
}
