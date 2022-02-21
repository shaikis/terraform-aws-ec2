resource "aws_iam_instance_profile" "instance_p" {
  name  = "${var.tag_role}-${var.tag_environment}-profile"
  roles = ["${aws_iam_role.instance_r.id}"]
}

resource "aws_iam_role" "instance_r" {
  name = "${var.tag_role}-${var.tag_environment}-role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "other" {
  name = "${var.tag_role}-${var.tag_environment}-other"
  role = "${aws_iam_role.instance_r.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:*",
        "s3:*"
    ],
      "Resource": [
        "*"
    ]
  }
 ]
}
EOF
}
