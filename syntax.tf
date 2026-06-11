provider "aws" {
  region = "us-east-2"
  profile = "configs"
}


resource "aws_instance" "webserver" {
  depends_on = [aws_security_group.webserversg]
  ami                    = var.this_ami
  instance_type          = var.This_instance_type
  key_name               = var.this_key_name
  vpc_security_group_ids = [var.This_vpc_security_group_ids ,aws_security_group.webserversg.id]
  #count = var.this_count
  tags = {
    Name = "webserver"
  }
   disable_api_termination = var.this_disable_Api_termination
}

resource "aws_security_group" "webserversg" {
  name = "webserversg"

  egress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress  {
    from_port   = 80
    to_port     = 80
    protocol    = "HTTP"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress  {
    from_port   = 22
    to_port     = 22
    protocol    = "SSH"
    cidr_blocks  = ["0.0.0.0/0"]
  }

  ingress  {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks  = ["0.0.0.0/0"]
  }
}
 

output "instancepubip" {
  value = aws_instance.webserver.public_ip

}

output "instanceid" {
  value = aws_instance.webserver.id

}
