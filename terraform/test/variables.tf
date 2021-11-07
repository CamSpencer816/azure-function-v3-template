variable "environment" {
  type        = string
  default     = "test"
  description = "The name of the environment to provision the resources."
}

variable "location" {
  type        = string
  default     = "canadacentral"
  description = "The name of the Azure location to provision the resources."
}

variable "service_name" {
  type        = string
  default     = "my-function"
  description = "The name of the service these resources belong to."
}

variable "service_name_short" {
  type        = string
  default     = "myfunc"
  description = "The short name of the service these resources belong to. Used in cases where names have a character limit."
}

variable "service_prefix" {
  type        = string
  default     = "cs"
  description = "The prefix of the service these resources belong to."
}
