provider "aws" {
  region  = "us-east-1"
  profile = "sudha_udemy"
}

/* terraform {
  backend "s3" {
    bucket = "sudha-22-feb-2023"
    key    = "state_file"
    region = "us-east-1"
  }
} */

resource "aws_db_instance" "webserverdb" {
  allocated_storage    = "10"
  skip_final_snapshot  = "true"
  engine               = "mysql"
  engine_version       = "5.7"
  db_name              = "mydb"
  username             = "foobar"
  password             = "password"
  instance_class       = "db.t3.micro"
  parameter_group_name = "default.mysql5.7"

  tags = {
    "Project" = "Testing"
  }
}
