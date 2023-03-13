variable "test_container" {
  description = "Value of the name for the Docker container"
  # basic types include string, number and bool
  type        = string
  default     = "ExampleNginxContainer"
}

variable "internal_name" {
type = number
default = 80

}

variable "external_name" {
type = number
default = 2224
}

