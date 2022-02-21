# terraform-aws-ec2
```
module "create_ec2_instance" {
    source                             = "git@github.com:shaikis/terraform-aws-ec2.git"
    instance_count                     =  1  # creates number of instances.
    ec2_instance_ami                   =  ami-xyz # ec2 instance AMi details.                    
    aws_instance_type                  =  t2.micro  # ec2 instance type                               
    subnet_id                          = "subnet-1, subnet-2"  # subnet id details.                    
    security_groups                    = [ sg-1, sg-2 ]   # security group id details.    
    associate_public_ip_address        = true | false                
    ebs_optimized                      = ture
    instance_hostname                  = test
    route53_zoneid                     = "R53Zoneid"
    tag_product                        = project1
    tag_environment                    = dev
    tag_role                           = db
    tag_contact                        = shaik.urs@gmail.com
    tag_cost_code                      = 12345676
    tag_description                    = "project1 db server"
    tag_orchestration                  = "terraform"
}
```
