# AWS Account Configuration
variable "account_number" {
  type        = string
  description = "The AWS account number."
  default     = "947039910131"  # Entrata Develop account
}

variable "region" {
  type        = string
  description = "Region where the stack will be built"
  default     = "us-east-1"
}

# Required Entrata Tagging Variables
variable "tag_owner-department" {
  type        = string
  description = "The department requesting/owning this asset. (Must be one of: sre, dev, dba)."
  default     = "dev"
}

variable "tag_owner-name" {
  type        = string
  description = "Name or username of the individual who owns the resource."
  default     = "vitaliy.clark"
}

variable "tag_owner-contact" {
  type        = string
  description = "Name or username of the individual to contact for billing or other concerns."
  default     = "vitaliy.clark"
}

variable "tag_creator-method" {
  type        = string
  description = "Method of asset creation. (Must be one of: console, api, cln, tf, salt, bref)."
  default     = "tf"
}

variable "tag_environment" {
  type        = string
  description = "The environment where the resource will exist."
  default     = "dev"
}

variable "map_tag" {
  type        = string
  description = "AWS migration tag"
  default     = "d-server-01gy6rj3lf0q6j"
}
