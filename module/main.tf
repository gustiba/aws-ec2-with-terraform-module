resource "aws_instance" "this" {
  count                     = var.INSTANCE_COUNT

  ami                       = var.AMI
  instance_type             = var.INSTANCE_TYPE
  vpc_security_group_ids    = var.SECURITY_GROUPS
  key_name                  = var.KEYNAME
  user_data                 = file(var.USERDATA)

  tags = {
    "Name" = "var.TAG-INSTANCE-${count.index}"
    //"Created by" = format("%s%d", var.TAG-SECOND)
  }
}