terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.74.0"
    }
  }
}

provider "aws" {
    region = "ap-south-1"  
}
resource "aws_instance" "web_server" {
  ami           = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "TerraKey"
 
 tags = {
    Name = "Webserver"
  }
}

output "instance_ip_address" {
  value = aws_instance.web_server.public_ip
}

