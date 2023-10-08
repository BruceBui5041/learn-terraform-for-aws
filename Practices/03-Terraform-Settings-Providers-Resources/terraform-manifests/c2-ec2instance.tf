# Resource: EC2 Instance
resource "aws_instance" "ec2demo" {
  ami           = "ami-0f98860b8bc09bd5c"
  instance_type = "t2.micro"
  user_data     = file("${path.module}/app1-install.sh") # NOTE: file is the fucntion of terraform
  tags = {
    "Name" = "EC2 Demooo"
  }
}
