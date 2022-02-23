#1. CREATE VPC
resource "aws_vpc" "vpc-alphalab" {
  cidr_block       = var.cidr_vpc
 #cidr_block       = "10.20.22.0/24"

  tags = {
    Name = "vpc-alphalab" #change customer with project name
  }
}

resource "aws_security_group" "sg-base" {
  vpc_id = aws_vpc.vpc-alphalab.id

  tags = {
    Name = "sg-base"
  }
}

resource "aws_security_group_rule" "ingress-rules" {
  count = length(var.ingress_rules)

  type              = "ingress"
  from_port         = var.ingress_rules[count.index].from_port
  to_port           = var.ingress_rules[count.index].to_port
  protocol          = var.ingress_rules[count.index].protocol
  cidr_blocks       = [var.ingress_rules[count.index].cidr_block]
  description       = var.ingress_rules[count.index].description
  security_group_id = aws_security_group.sg-base.id
}

// THIS IS OUTBOUND RULES TO OPEN ACCESS FROM ANYWHERE
resource "aws_security_group_rule" "egress-rules" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1" #semantically equivallent to "all"
  cidr_blocks      = ["0.0.0.0/0"]
  security_group_id = aws_security_group.sg-base.id
}