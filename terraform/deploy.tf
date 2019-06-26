# Set the provider as AWS
provider "aws" {
  region     = "us-east-2"
}
# Filter the ami by the name
data "aws_ami" "haven" {
  most_recent = true
  filter {
    name   = "name"
    values = ["authors-haven"]
  }
  owners = ["387883916874"] 
}

# Define the security group 
resource "aws_security_group" "sgweb" {
  name = "security_group"
  description = "Allow incoming HTTP connections & SSH access"
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = -1
    to_port = -1
    protocol = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks =  ["0.0.0.0/0"]
  }
  egress {
  from_port   = 0
  to_port     = 0
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}
  tags {
    Name = "Web Server SG"
  }
}

# Create the aws instance with the the ami gotten above
resource "aws_instance" "haven" {
  ami           = "${data.aws_ami.haven.id}"
  instance_type = "t2.micro"
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
}