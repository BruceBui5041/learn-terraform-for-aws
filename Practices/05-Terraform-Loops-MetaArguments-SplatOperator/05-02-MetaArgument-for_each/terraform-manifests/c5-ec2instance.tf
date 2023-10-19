data "aws_availability_zones" "my_az" {
  filter {
    name = "opt-in-status"
    values = [ "opt-in-not-required" ] # NOTE: This will provide a list of az
  }
}

resource "aws_instance" "ec2-05" {
  ami           = data.aws_ami.amzlinux2.id
  # instance_type = var.instance_type_list[1]
  instance_type          = var.instance_type_map["dev"]
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  # for_each is a meta-arg accepts a map or list and CREATE AN INSTANCE FOR EACH ITEM
  for_each = toset(data.aws_availability_zones.my_az.names)
  availability_zone = each.key # NOTE: each.key == each.value because for_each is a set of string not map

  tags = {
    "Name" = "EC2 for_each Demo 05 ${each.key}" # NOTE: the value of item in for_each
  }
}
