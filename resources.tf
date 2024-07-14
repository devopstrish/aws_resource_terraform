resource "aws_instance" "demo" {

  instance_type = var.instance_type
  ami           = var.ami
  count         = var.instance_count
}

resource "aws_vpc" "myvpc" {
  cidr_block       = var.cidr_block1
  instance_tenancy = "default"

  tags = {
    Name = "myvpc"
  }
}
resource "aws_vpc" "vpc1" {
  cidr_block       = var.cidr_block2
  instance_tenancy = "default"

  tags = {
    Name = "vpc1"
  }
}