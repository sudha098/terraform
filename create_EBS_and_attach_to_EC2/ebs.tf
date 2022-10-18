resource "aws_ebs_volume" "myEBS" {
  availability_zone = "us-east-1a"
  size              = 1

  tags = {
    Name = "MYEBS"
  }
}