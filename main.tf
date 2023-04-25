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
  user_data = <<EOF
                     #!/bin/bash
                     sudo su
                     curl --location https://rpm.nodesource.com/setup_16.x | bash -
                     yum -y install nodejs
                     yum -y install git
                     git clone https://github.com/supreet-kulkarni/Sample-Node-APP.git
                     cd /Sample-Node-APP
                     npm install
                     npm start
            EOF
 tags = {
    Name = "Webserver"
  }
}

output "instance_ip_address" {
  value = aws_instance.web_server.public_ip
}

