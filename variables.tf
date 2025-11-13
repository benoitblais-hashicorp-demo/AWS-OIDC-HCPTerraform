variable "tfc_organization_name" {
  description = "(Required) The name of the HCP Terraform organization."
  type        = string
  default     = "benoitblais-hashicorp"
}

variable "tfc_project_name" {
  description = "(Required) The name of the HCP Terraform project."
  type        = string
  default     = "*"
}

variable "tfc_workspace_name" {
  description = "(Required) The name of the HCP Terraform workspace."
  type        = string
  default     = "*"
}

variable "tfc_hostname" {
  description = "(Optional) The address of the HCP Terraform instance."
  type        = string
  default     = "app.terraform.io"
}
