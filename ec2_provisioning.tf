data "template_file" "cloud_init" {
  template = "${file("${path.module}/provision/templates/cloudConfig.tpl")}"

  vars {
    instance_hostname        = "${var.instance_hostname}"
  }
}

resource "template_cloudinit_config" "instance_config" {
  gzip          = false
  base64_encode = false

  part {
    content_type = "text/cloud-config"
    content      = "${data.template_file.cloud_init.rendered}"
  }

  lifecycle {
    create_before_destroy = true
  }
}