output "ec2_instance_id" {
    value = aws_instance.ec2instance.id
}

output "ec2_instance_private_ip" {
    value = aws_instance.ec2instance.private_ip
}

output "ec2_instance_ipv6_address" {
    value = aws_instance.ec2instance.ipv6_addresses
}