resource "aws_instance" "ec2-04" {
  ami                    = data.aws_ami.amzlinux2.id # NOTE: Reference Datasource to get the latest AMI ID
  instance_type          = var.instance_type
  user_data              = file("${path.module}/app1-install.sh")
  key_name               = var.instance_keypair
  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]

  tags = {
    "Name" = "EC2 Session 04"
  }
}
