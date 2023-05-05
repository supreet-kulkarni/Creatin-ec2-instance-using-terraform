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
resource "aws_instance" "test" {
  ami           ="ami-062df10d14676e201"
  instance_type = "t2.micro"

  tags = {
    Name = "Webapp"
  }
}

