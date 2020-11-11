  #Provision Jenkins EC2 Instance


  data "template_file" "user_data" {
  template = "${file("${path.module}/userdata.tpl")}"
  }


  provider "aws" {
    profile = "default"
    region  = "eu-west-1"
  }

    resource "aws_key_pair" "ubuntu" {
    key_name   = "femi"
    public_key = file("keyfiles/ec2.pub")
  }

    resource "aws_security_group" "ubuntu" {
    name        = "ubuntu-security-group"
    description = "Allow HTTP, HTTPS and SSH traffic"

    ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
    description = "HTTPS"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
    description = "JENKINS HTTP"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
    Name = "terraform"
    }
  }


    resource "aws_instance" "ubuntu" {
    key_name      = aws_key_pair.ubuntu.key_name
    ami           = "ami-0823c236601fef765"
    instance_type = "t2.large"
    user_data = "${data.template_file.user_data.rendered}"

    tags = {
    Name = "jenkins-server"
    }

    vpc_security_group_ids = [
    aws_security_group.ubuntu.id
    ]

    connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("keyfiles/ec2")
    host        = self.public_ip
    }

    ebs_block_device {
    device_name = "/dev/sda1"
    volume_type = "gp2"
    volume_size = 30
    }
  }

    resource "aws_eip" "ubuntu" {
    vpc      = true
    instance = aws_instance.ubuntu.id
  }
