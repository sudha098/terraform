resource "aws_instance" "app" {
  ami           = "ami-08c40ec9ead489470"
  instance_type = "t2.micro"
  availability_zone = "us-east-1a"

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_volume_attachment" "ebs_attach" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.myEBS.id
  instance_id = aws_instance.app.id
}