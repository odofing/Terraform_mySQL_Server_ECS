variable "prefix" {
  default = "blog-app"
}

variable "project" {
  default = "blog-app"
}

variable "contact" {
  default = "<odofing@gmail.com>"
}

variable "db_username" {
  description = "Username for the RDS mySQL instance"
}

variable "db_password" {
  description = "Password for the RDS mySQL instance"
}
