provider "aws" {
    region = "ap-south-1"  
}
resource "aws_instance" "web-serverS" {
  ami           = "ami-062df10d14676e201"
  instance_type = "t2.micro"
  availability_zone = "ap-south-1a"
  key_name = "TerraKey"
 tags = {
    Name = "Webservers"
  }
}


