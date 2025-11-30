resource "aws_instance" "webserver" {
    ami = lookup(var.cloud_ami, var.region_aws)
    instance_type = var.vm_type
    key_name = aws_key_pair.sshkeypair.key_name
    security_groups = ["SG_1"]

    connection {
    type = "ssh"
    user = "ec2-user"
    host = self.public_ip
    private_key = file("sudha")
    }

    provisioner "file" {
        source = "./web.sh"
        destination = "/tmp/web.sh"
    }

    provisioner "remote-exec" {
      inline = [
          "sudo chmod +x /tmp/web.sh",
          "sudo /tmp/web.sh"
      ]
    }

    provisioner "local-exec" {
        command = "echo ${self.public_ip}"
    }

}

resource "aws_key_pair" "sshkeypair" {
    key_name = "sudha"
    public_key = file("sudha.pub")
}


