variable "aws_vpc" {
    default="vpc-e7c6aa80"
}

variable "volume_type" {
  default="gp2"
}

variable "my_key_name" {   
  type = "string"           
  default = "dimbu_terraform"
}      

variable "NtpRegion" {
  type = "string"
  default = "europe"
}

variable "AdopUsername" {
  type = "string"
  default = ""
}

variable "AdopUserPassword" {
  type = "string"
  default = ""
}
