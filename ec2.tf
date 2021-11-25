provider "aws" {
  region = "us-east-2"
}

resource "aws_instance" "dev" {
  ami           = "ami-0d718c3d715cec4a7"
  instance_type = var.instancetype
  key_name  = "devopsnew"
  provisioner "remote-exec" {
      inline = [
        "sudo amazon-linux-extras install -y nginx1.12",
        "sudo systemctl start nginx"
      ]
      connection {
        type = "ssh"
        host = self.public_ip
        user = "ec2-user"
        private_key = file("./devopsnew.pem")
      }
    
  }  
}
/*
resource "aws_instance" "prod" {
  ami           = "ami-0d718c3d715cec4a7"
  instance_type = var.instancetype
  count = var.istest == false ? 1 : 0
  #instance_type = "t2.micro"  
  }


resource "aws_eip" "lb" {
    vpc = true  
}

resource "aws_eip_association" "eip_asoc" {
    instance_id = aws_instance.myec2.id
    allocation_id = aws_eip.lb.id  
}



resource "aws_s3_bucket" "mys3" {
    bucket = "lab-terraform-glen-demo-2008"
  
}

output "mys3bucket" {
    value = aws_s3_bucket.mys3.bucket_domain_name  
}


resource "aws_instance" "myec2" {
  ami           = "ami-0d718c3d715cec4a7"
  instance_type = "t2.micro" 
  count = 2
  tags = {
    Name = "first-instance"
    }
  }
  */