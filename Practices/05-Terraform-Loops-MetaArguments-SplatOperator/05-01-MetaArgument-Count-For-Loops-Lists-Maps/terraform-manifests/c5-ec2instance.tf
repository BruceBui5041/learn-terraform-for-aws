resource "aws_instance" "ec2-05" {
  ami           = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type_list[1]
  instance_type          = var.instance_type_map["dev"]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
  count                  = 2 # NOTE: Number of instances
  tags = {
    "Name" = "EC2 Count Demo 05 ${count.index}" # NOTE: Index of the instance
  }
}
