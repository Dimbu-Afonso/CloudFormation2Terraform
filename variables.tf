variable "aws_access_key"{
    default = ""
}
variable "aws_secret_key"{
    default = ""
}

variable "aws_vpc" {
    default="vpc-e7c6aa80"
}

variable "volume_type" {
  default="gp2"
}

variable "my_key_name" {   
  type = "string"           
  default = "dimbuTerraform-ADOP"
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
