terraform {
  required_version = ">= 1.1"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 5.0"
    }
  }
}

provider "aws" {
  region = "eu-north-1"
  access_key = var.access_key
  secret_key = var.secret_key
}

resource "aws_instance" "myec2" {
  ami           = "resolve:ssm:/aws/service/ami-amazon-linux-latest/amzn2-ami-hvm-x86_64-gp2"
  instance_type = "t3.micro"

  tags = {
    Name = "MyInstance"
  }
}
output "my_ip" {
value = aws_instance.myec2.public_ip
}
