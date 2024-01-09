variable "ami_id" {
  default = "ami-0c7217cdde317cfec"
}

variable "instance_type" {
  default = "t2.medium"
}
variable "vpc_id" {
  type = string
}
variable "security_group_id" {
  type = string
}
variable "public_subnet_id" {
  type = string
}
