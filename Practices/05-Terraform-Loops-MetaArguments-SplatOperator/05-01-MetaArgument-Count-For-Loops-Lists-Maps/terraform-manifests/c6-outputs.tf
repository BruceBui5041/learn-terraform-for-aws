output "for_output_list" {
  description = "For loop with List"
  value       = [for instance in aws_instance.ec2-05 : instance.public_dns]
}

output "for_output_map1" {
  description = "For loop with Map"
  value       = { for instance in aws_instance.ec2-05 : instance.id => instance.public_dns } # NOTE: `instance.id` is key of the key-value pair
}

output "for_output_map2" {
  description = "For loop with Map - Advanced"
  value       = { for c, instance in aws_instance.ec2-05 : c => instance.public_dns } # NOTE: `c` is index
}

output "legacy_splat_instance_publicdns" {
  description = "Legacy splat operator"
  value       = aws_instance.ec2-05.*.public_dns # NOTE: if `count` in the aws_instance then have to use * to log public_dns for each instance
}

output "latest_splat_instance_publicdns" {
  description = "Generalized latest splat operator"
  value       = aws_instance.ec2-05[*].public_dns # NOTE: if `count` in the aws_instance then have to use * to log public_dns for each instance
}
