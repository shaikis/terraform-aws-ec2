resource "aws_instance" "ec2instance" {
  count                       = var.instance_count
  ami                         = var.ec2_instance_ami
  associate_public_ip_address = var.associate_public_ip_address
  ebs_optimized               = var.ebs_optimized
  instance_type               = var.aws_instance_type
  subnet_id                   = "${element(split(",", var.subnet_id), 0)}"
  vpc_security_group_ids      = var.security_groups
  user_data_base64            = "${template_cloudinit_config.instance_config.rendered}"
  key_name                    = var.key_name
  iam_instance_profile        = aws_iam_instance_profile.instance_p.id
  monitoring                  = var.instance_monitoring

  root_block_device {
    volume_size = var.instance_disk_size
    volume_type = "gp2"
  }

  tags = {
    Name = "${var.tag_product}-${var.tag_role}-${var.tag_environment}"
    Product = "${var.tag_product}"
    Contact = "${var.tag_contact}"
    CostCode = "${var.tag_cost_code}"
    Environment = "${var.tag_environment}"
    Role = "${var.tag_role}"
    Description = "${var.tag_description}"
    Orchestration = "${var.tag_orchestration}"
  }
}

# create R53 A record to access the server. 
resource "aws_route53_record" "instance" {
  count   = "${var.instance_count}"
  zone_id = "${var.route53_zoneid}"
  name    = "${var.tag_role}${count.index}"
  type    = "A"
  ttl     = "300"
  records = ["${element(aws_instance.ec2instance.*.private_ip, count.index)}"]
}
