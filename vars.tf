variable "AWS_REGION" {
  default = "ap-southeast-3"
}

variable "cidr_vpc" {
  default = "10.20.0.0/16"
}

variable "access_key" {
  default = ""
}

variable "secret_key" {
  default = ""
}

// LIST OF INBOUND RULES FOR SECURITY GROUP, YOU CAN ADD MORE RULES BY COPYING RULES BLOCK
variable "ingress_rules" {
    type = list(object({
      from_port   = number
      to_port     = number
      protocol    = string
      cidr_block  = string
      description = string
    }))
    default     = [
        {
          from_port   = 22
          to_port     = 22
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0" #Variables not allowed in this func, we can use whitelisted IP Addrs
          ipv6_cidr_block = "::/0"
          description = "Allow SSH"
        },
        {
          from_port   = 80
          to_port     = 80
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          ipv6_cidr_block = "::/0"
          description = "Allow HTTP"
        },
        {
          from_port   = 443
          to_port     = 443
          protocol    = "tcp"
          cidr_block  = "0.0.0.0/0"
          ipv6_cidr_block = "::/0"
          description = "Allow HTTPS"
        }
    ]
}