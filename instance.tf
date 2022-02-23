module "module-webserver" {
  source = "./module/"

  INSTANCE_COUNT  = 2
  AMI             = "ami-0c20b8b385217763f"
  INSTANCE_TYPE   = "t2.micro"
  SECURITY_GROUPS = [aws_security_group.sg-base.id]
  KEYNAME         = "alpha-lab.pem"
  USERDATA       = "./userdata.txt"
  TAG-INSTANCE         = "webserver"
  # TAG-SECOND       = "Gusti"

}