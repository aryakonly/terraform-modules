resource "aws_security_group" "sg" {
  name = var.my-sg-name
  description = var.sg-descrip
  vpc_id = var.vpc_id
   ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
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
}

resource "aws_instance" "Ec2Instance" {
    ami           = var.image
    instance_type = var.instance_type
    key_name = var.key-pair
    vpc_security_group_ids = [aws_security_group.sg.id]
    subnet_id = var.subnet_id
    tags = {
      Name = var.instance_name
    }
}