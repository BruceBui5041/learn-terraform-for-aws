
// splat not working with for_each

output "instance_publicip" {
  description = "EC2 instance public IP"
  #value = aws_instance.myec2vm.*.public_ip   # Legacy Splat
  #value = aws_instance.myec2vm[*].public_ip  # Latest Splat
  value = toset([for instance in aws_instance.ec2-05: instance.public_ip])
}

output "instance_publicdns" {
  description = "EC2 instance public DNS"
  #value = aws_instance.myec2vm.*.public_ip   # Legacy Splat
  #value = aws_instance.myec2vm[*].public_ip  # Latest Splat
  value = toset([for instance in aws_instance.ec2-05: instance.public_dns])
}

output "instance_publicdns2" {
  value = tomap({ for az, instance in aws_instance.ec2-05: az => instance.public_dns })
}