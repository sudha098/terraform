resource "aws_instance" "ec2instance" {
  ami           = lookup(var.cloud_ami, var.region_aws)
  instance_type = var.vm_type
  key_name      = aws_key_pair.sshkeypair.key_name
}

resource "aws_key_pair" "sshkeypair" {
  key_name   = "sudha"
  public_key = file("sudha.pub")
}