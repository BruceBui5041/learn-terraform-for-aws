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

# EC2 instance type list
variable "instance_type_list" {
  description = "EC2 Instance Type"
  type        = list(string)
  default     = ["t3.micro", "t3.small"]
}

variable "instance_type_map" {
  description = "EC2 Instance Type"
  type        = map(string)
  default = {
    "dev"  = "t3.micro"
    "qa"   = "t3.small"
    "prod" = "t3.large"
  }
}
