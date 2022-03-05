variable "intranet_cidr_blocks" {
  type          = list(string)
  default       = []
  description   = "List of CIDR blocks."
}

variable "vpc_name" {
  type          = string
  default       = "default"
  description   = "Name of the Virtual Private Cloud."
}

variable "inbound" {
  type          = list(string)
  default       = [ "" ]
  description   = "Name the type of ingress traffic to accept."
}