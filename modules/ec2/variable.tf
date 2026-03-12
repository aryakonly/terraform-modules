variable "my-sg-name" {
  default = "my-sg"
}

variable "sg-descrip" {
  default = "Allow ssh, httpd and tomcat"
}

variable "vpc_id" {
  description = "Enter Vpc id"
}
variable "image" {
    default = "ami-051a31ab2f4d498f5"
  
}
variable "instance_type" {
  default = "t3.micro"
}
variable "instance_name" {
  default = "static-webiste"
}

variable "subnet_id" {
  description = "Enter subnet id"
}

variable "key-pair" {
  default = "mumbai-key"
}