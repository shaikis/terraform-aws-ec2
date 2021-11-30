# terraform-aws-ec2
```
module "create_ec2_instance" {
    source                             = "git@github.com:shaikis/terraform-aws-ec2.git?tag=1.0.2"
    ec2_instance_ami                   =   # ec2 instance AMi details.                    
    aws_instance_type                  =   # ec2 instance type                 
    availability_zone                  =   # availability zone details.                       
    subnet_id                          =   # subnet id details.                    
    security_groups                    =    # security group id details.
    user_data                          =    # user data if anything
    ec2_instance_iam_profile           =    # iam profile details            
    associate_public_ip_address        = true | false                
    ebs_optimized                      = ture   
}
```
