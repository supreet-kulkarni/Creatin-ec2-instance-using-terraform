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
resource "aws_ec2_instance_state" "webserver" {
  instance_id ="i-0d1844b2be410822c"
  state       = "stopped"
}
