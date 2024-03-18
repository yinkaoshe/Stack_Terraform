# module "STACK-TAGS" {
#   source="github.com/stackitgit/stackterraform.git?ref=stackmodules/STACK_TAGS"
#   #  source="./STACK_TAGS"
#   required_tags={
#     Environment=var.environment,
#     OwnerEmail=var.OwnerEmail,
#     System=var.subsystem,
#     Backup=var.backup,
#     Region=var.region
#   }
# }

### Declare Key Pair
resource "aws_key_pair" "Stack_KP" {
  key_name   = "stackkp"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

resource "aws_security_group" "stack-sg" {
#  vpc_id = var.default_vpc_id
  name        = "Stack-WebDMZ"
  description = "Stack IT Security Group For CliXX System"
}
resource "aws_security_group_rule" "ssh" {
  security_group_id = aws_security_group.stack-sg.id
  type              = "ingress"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = ["0.0.0.0/0"]
}
#  data "aws_ami" "stack_ami" { 
#    owners     = ["self"] #to learn more about regular expression https://www.terraform.io/docs/language/functions/regex.html
#    name_regex = "^"
#    filter {
#      name   = "name"
#      values = [var.AWS_REGION]
#    }
#  }
### OUTPUT SUBNET IDS
# data "aws_subnet" "stack_sub_id_list" {
#   vpc_id = var.vpc_id
# }
# data "aws_availability_zones" "az" {
# }
# ##outputing SUBNET INFO
# data "aws_subnet" "stack_subnets" {
#  for_each = data.aws_subnet.stack_sub_id_list.id
#  id       = each.value
# }
# output "subnet_id" {
#  #value = [for s in data.aws_subnet.stack_subnets : s.cidr_block]
#  value = [for s in data.aws_subnet.stack_subnets : s.id]
#  #value = [for s in data.aws_subnet.stack_subnets : element(split("-", s.availability_zone), 2)]
# }

resource "aws_instance" "server" {
  ami                            = var.ami
  instance_type                  = var.instance_type
  vpc_security_group_ids         = [aws_security_group.stack-sg.id]
  user_data                      = data.template_file.bootstrap.rendered
  key_name                       = aws_key_pair.Stack_KP.key_name
  subnet_id                      = var.subnet
 root_block_device {
    volume_type                  = "gp2"
    volume_size                  = 30
    delete_on_termination        = true
    encrypted= "true"
  }
  tags = {
   Name                          = "Application_Server_Aut"
   Environment                   = var.environment
   OwnerEmail                    = var.OwnerEmail
}
}