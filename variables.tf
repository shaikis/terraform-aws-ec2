variable "ec2_instance_ami" {}
variable "aws_instance_type" {}
variable "availability_zone" {}
variable "subnet_id" {}
variable "security_groups" {
    type = list
}
variable "user_data" {
    default = ""
}
variable "ec2_instance_iam_profile" {}
variable "associate_public_ip_address" {
    type = bool
    default = false
}
variable "ebs_optimized" {
    type = bool
}
variable "key_name" {
    type = string
}

variable "instance_hostname" {
  
}

variable "instance_count" {}

variable "instance_monitoring" {
  default = true
}

variable "instance_disk_size" {
    type = number
    default = 50 # volume size in Gibibytes
}

variable "route53_zoneid" {}
# Tag variables here. 
variable "tag_product" {}
variable "tag_environment" {}
variable "tag_role" {}
variable "tag_contact" {}
variable "tag_cost_code" {}
variable "tag_description" {}
variable "tag_orchestration" {}