resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh_key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "control" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name
 
tags = {
   Name = "control",
 }
}

resource "aws_instance" "worker1" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name
 
 tags = {
   Name = "worker1",
 }
}


resource "aws_instance" "worker2" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name
 
 tags = {
   Name = "worker2",
 }
}

resource "aws_instance" "worker3" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name

 tags = {
   Name = "worker3",
 }
}

resource "aws_instance" "jira-prod" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name

 tags = {
   Name = "jira-prod",
 }
}

resource "aws_instance" "jenkins-prod" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name

 tags = {
   Name = "jenkins-prod",
 }
}

resource "aws_instance" "nagios-prod" {
 ami                       = var.ami_id 
 instance_type             = var.instance_type
 vpc_security_group_ids    = [var.security_group_id]
 subnet_id                 = var.public_subnet_id
 key_name                  = aws_key_pair.ssh_key.key_name

 tags = {
   Name = "nagios-prod",
 }
}
