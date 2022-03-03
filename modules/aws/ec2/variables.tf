variable "ami" {
  type          = string
  default       = "ami-08b6f2a5c291246a0"
  description   = "Amazon Machine Image, operating system for the server."
}

variable "type" {
  type          = string
  default       = "t2.micro"
  description   = "Instace types, combination of CPU, memory, storage and network capacity."
}

variable "root_size" {
  type          = string
  default       = "20"
  description   = "Root disk space size."
}

variable "server_name" {
  type          = string
  default       = ""
  description   = "Server name."
}

variable "ssh_key" {
  type          = string
  default       = "default-key"
  description   = "Key to access the server via ssh protocol."
}