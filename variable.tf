variable "cidr_for_vpc" {
  description = "cidr range for vpc"
  type        = string

}

variable "tenancy" {
  description = "instance teenancy for instance launched in vpc"
  type        = string
  default     = "default"

}

variable "dns_hostnames_enabled" {
  description = " A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = "false"

}

variable "dns_support_enabled" {
  description = " A boolean flag to enable/disable DNS support in the VPC."
  type        = bool
  default     = "true"

}


variable "vpc_name" {
  description = "a name for vpc."
  type        = string
  default     = "terraform-vpc-lwplabs"

}

variable "web_server_name" {
  description = "name for the instance"
  type        = string

}
# variable "inbound_rules_web" {
#   description = "ingress rule for security group of web server"
#   type = list(object({
# port = number
# description = string
# protocol = string
#   }))
#   default = [ {
#     port = 22
#     description = "this is for ssh connection"
#     protocol = "tcp"
#   },
#   {
#     port = 80
#     description = "this is for web hosting"
#     protocol = "tcp"
#   } ]

# }
# variable "port" {
#   type = list(number)
#   description = "port number for inbound traffic"
#   default = [ 22, 80 ]
# }
variable "inbound_rules_web" {
  type = list(object({
    description = string
    protocol = string
    port = number
  }))
  description = "ingress rule for security group of web server" 
  default = [ {
    description = "inbound rule for web server for ssh"
    protocol = "tcp"
    port = 22
  },
  {
    description = "ingress rule for web server for http"
    protocol = "tcp"
    port = 80 
  } ]
}