variable "aws_role_name" {
  description = "(Optional) Name for the IAM role to be used, unique within your account"
  type        = string
  default     = null

  validation {
    condition     = length(var.role_name) <= 64
    error_message = "IAM role name must be no longer than 64 characters."
  }

  validation {
    condition     = can(regex("^[A-Za-z0-9_+=,.@-]+$", var.role_name))
    error_message = "IAM role name can only include alphanumeric characters and _+=,.@- punctuation."
  }
}

variable "tfc_hostname" {
  description = "(Optional) The address of the HCP Terraform instance."
  type        = string
  default     = "app.terraform.io"
}

variable "tfc_organization_name" {
  description = "(Optional) The name of the HCP Terraform organization."
  type        = string
  default     = "benoitblais-hashicorp"
}

variable "tfc_project_name" {
  description = "(Optional) The name of the HCP Terraform project."
  type        = string
  default     = "*"
}

variable "tfc_stack_name" {
  description = "(Optional) The name of the HCP Terraform Stack."
  type        = string
  default     = "*"
}

variable "tfc_stack_project_name" {
  description = "(Optional) The name of the HCP Terraform Stack project."
  type        = string
  default     = "*"
}

variable "tfc_workspace_name" {
  description = "(Required) The name of the HCP Terraform workspace."
  type        = string
  default     = "*"
}
