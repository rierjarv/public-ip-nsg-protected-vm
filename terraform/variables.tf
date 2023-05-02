variable "allowed_ips" {
  description = "list of allowed ip addresses"
  default = [""]
}

variable "environment" {
    description = "environment in question (dev, qa, prod etc)"
    default = "testenv" 
}

variable "project_name" {
  description = "name of the project"
  default = "testproj"
}

variable "author_initials" {
    description = "author initials"
    default = "abc"
}