variable "cidr_vpc" {
  type        = string
  description = "cidr to aws vpc"
  #default     = "10.0.0.0/16"
}

variable "cidr_subnet" {
  type        = string
  description = "cidr to aws vpc subnet"
  #default = "10.0.1.0/24"
}

variable "environment" {
  type        = string
  description = "environment with the resources will be used."
}
