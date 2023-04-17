locals {
  ports_in = [
    443,
    80,
    22,
    1935,
    3389
  ]
}

resource "aws_security_group" "sg" {
  name        = "custom SG"
  description = "Allow RTMP related traffic"

  dynamic "ingress" {
    for_each = toset(local.ports_in)

    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Type = var.machine_use
  }
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instance_type
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name = "rta-aws"

  tags = {
    Type = var.machine_use
  }
}

resource "aws_eip" "eip" {
  instance = aws_instance.web.id
  vpc      = true
}

output "ec2_ip" {
    value = aws_eip.eip.public_ip
}