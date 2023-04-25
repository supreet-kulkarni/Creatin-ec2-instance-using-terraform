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
                    apt update
                    apt install apache2 -y
                    wget http://prdownloads.sourceforge.net/awstats/awstats-7.3.tar.gz
                    tar -xvzf awstats-7.3.tar.gz
                    cd awstats-7.3/
                    cd wwwroot/
                    cp -r icon /var/www/html/
                    chown www-data:www-data -R /var/www/html/icon/
                    a2enmod cgi
                    service apache2 restart
                    mv cgi-bin awstat
                    chown www-data:www-data -R awstat
                    mv awstat /usr/lib/cgi-bin
                    cd /usr/lib/cgi-bin/awstat
                    cp awstats.model.conf awstats.linux.conf

            EOF
 tags = {
    Name = "Webserver"
  }
}

output "instance_ip_address" {
  value = aws_instance.web_server.public_ip
}

