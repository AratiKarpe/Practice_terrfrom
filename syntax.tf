provider "aws" {
  region  = "us-east-2"
  profile = "configs"
}

resource "aws_security_group" "webserversg" {
  name = "webserversg"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_instance" "webserver" {
  ami           = var.this_ami
  instance_type = var.this_instance_type
  key_name      = var.this_key_name

  vpc_security_group_ids = [
    aws_security_group.webserversg.id
  ]

  disable_api_termination = var.this_disable_api_termination

  tags = {
    Name = "webserver"
  }
}

output "instancepubip" {
  value = aws_instance.webserver.public_ip
}

output "instanceid" {
  value = aws_instance.webserver.id
}
