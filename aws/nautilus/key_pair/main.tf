resource "aws_key_pair" "deployer" {
  key_name   = "datacenter-kp"
  public_key = file("datacenter-kp.pub")
}
