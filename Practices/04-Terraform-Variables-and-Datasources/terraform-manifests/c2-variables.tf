# AWS region variable
variable "aws_region" {
  description = "Region in which AWS Resources to be created"
  type        = string
  default     = "ap-southeast-1"
}

# AWS EC2 Instance Type
variable "instance_type" {
  description = "EC2 Instance Type"
  type        = string
  default     = "t3.micro"
}

# AWS EC2 Key Pair
variable "instance_keypair" {
  description = "EC2 keypair"
  type        = string
  default     = "terraform-key"
}
