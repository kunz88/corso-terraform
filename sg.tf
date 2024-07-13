// 
/* resource "aws_security_group" "first" {
  name        = "kunz"
  description = "terraform first resource created ever"
  tags = {
    Name = "my name"
  }
} */
// query per imagine ubuntu
// non crea nulla
/* 
data "aws_ami" "last_ubuntu" {
  most_recent = true
  owners      = ["099720109477"] # Canonical
  name_regex  = "^ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"
}

// stampa output di una query
output "latest_ubuntu" {
  value = data.aws_ami.last_ubuntu.image_id
}
 */

// crea istanza 
/* resource "aws_instance" "first" {
  ami                    = data.aws_ami.last_ubuntu.image_id
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.first.id]
  tags = {
    Name = "My first ec2 with terraform"
  }
} */

/* module "my_first_module" {
  source = "./modules/myFirstModules/"
  prefix = "peppemod"

}
resource "aws_security_group" "ssh" {
  name        = "ssh_from_module"
  description = "Allow ssh"


  ingress {
    description      = "ssh from module"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["${module.my_first_module.my_private_ip}/32"]
  }
}
 */
/* module "web_server_sg" {
  source = "terraform-aws-modules/security-group/aws//modules/http-80"

  name                = "web-server"
  description         = "Security group for web-server with HTTP ports open within VPC"
  vpc_id              = "vpc-0035ee9a684bab790"
  ingress_cidr_blocks = ["0.0.0.0/0"]
}  
 */

/*  data "aws_ssm_parameter" "for_count" {
  name = "activate-security"
}

resource "aws_security_group" "sg_with_parameter" {
  count = data.aws_ssm_parameter.for_count.value == "true" ? 1 : 0
  name        = "my_sg_with_parameter"
  description = "terraform resource created ever"
  tags = {
    Name = "my name with count"
  }
}

locals {
  my_array_of_names = ["giuseppe", "pippo", "pluto"]
}

resource "aws_security_group" "sg_with_count_array" {
  count = length(local.my_array_of_names)
  name        = "my_sg_with_count-${local.my_array_of_names[count.index]}"
  description = "terraform first resource created ever"
  tags = {
    Name = "my name with count ${local.my_array_of_names[count.index]}"
  }
} */
/* variable "rules" {
  type = list(object({
    port        = number
    proto       = string
    cidr_blocks = list(string)
  }))
  default = [
    {
      port        = 80
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 22
      proto       = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    },
    {
      port        = 3689
      proto       = "tcp"
      cidr_blocks = ["6.7.8.9/32"]
    }
  ]

}
resource "aws_security_group" "my-sg" {
  name = "my-dynamic-sg"

  dynamic "ingress" {
    for_each = var.rules
    content {
      from_port   = ingress.value["port"]
      to_port     = ingress.value["port"]
      protocol    = ingress.value["proto"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Terraform-Dynamic-SG"
  }
} */