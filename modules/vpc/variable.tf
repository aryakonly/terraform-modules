variable "vpc_cidr" {
  default = "192.34.0.0/16"
}

variable "subnet_cidr" {
  default = "192.34.0.0/20"
}

variable "available_zone" {
  default = "ap-south-1a"
}

variable "rt_table_name" {
  default = "my-rt"
}
variable "sub-name" {
  default = "public-subnet"
}
variable "igw" {
  default = "my-igw"
}