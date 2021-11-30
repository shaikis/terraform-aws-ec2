variable "ec2_instance_ami" {}
variable "aws_instance_type" {}
variable "availability_zone" {}
variable "subnet_id" {}
variable "security_groups" {}
variable "user_data" {
    default = ""
}
variable "ec2_instance_iam_profile" {}
variable "associate_public_ip_address" {
    type = bool
}
variable "ebs_optimized" {
    type = bool
}
variable "key_name" {
    type = string
}