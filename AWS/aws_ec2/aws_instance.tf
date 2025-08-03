provider "aws" {
  region  = "us-east-1"
  profile = "sudha_udemy"
}

resource "aws_instance" "webserver" {
  instance_type = "t2.micro"
  ami           = "ami-0557a15b87f6559cf"

  tags = {
    Project = "Testing"
    Team    = "DevOps"
  }
}