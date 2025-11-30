variable "region_aws" {
  default = "ap-south-1"
  description = "EC2 instance region"
}

variable "a_key" {}

variable "s_key" {}

variable "cloud_ami" {
    type = map
    default = {
        us-east-1 = "ami-0c02fb55956c7d316"
        ap-south-1 = "ami-04893cdb768d0f9ee"
        us-east-2 = "ami-064ff912f78e3e561"
        us-west-1 = "ami-04a50faf2a2ec1901"
    }
    description = "Image file for virtual machine"
}

variable "vm_type" {
    default = "t2.micro"
    description = "VM Configuration"
}
