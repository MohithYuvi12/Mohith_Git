provider "aws" {
}

resource "aws_instance" "examples" {
  ami                         = "ami-05fa00d4c63e32376"
  instance_type               = var.instance_type
  count                       = var.no_of_instance
  associate_public_ip_address = var.enable_public_ip
  /*tags {
Name= "Mohith"
}*/
  tags = var.project_env

}

resource "aws_iam_group" "example" {
  count = length(var.user_names)
  name  = var.user_names[count.index]
}

variable "user_names" {
  description = "To create diff users"
  type        = list(string)
  default     = ["user1", "user2", "user3"]
}

variable "instance_type" {
  description = "this var for instance type"
  type        = string
  default     = "t2.micro"
}

variable "no_of_instance" {
  description = "no.of instances"
  type        = number
  default     = 2
}

variable "enable_public_ip" {
  description = "enable public ip address"
  type        = bool
  default     = false
}

variable "project_env" {
  description = "to add tags"
  type        = map(string)
  default = {
    project     = "swiggy"
    environment = "test"
  }
}
