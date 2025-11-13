<!-- BEGIN_TF_DOCS -->
# AWS OIDC HCP Terraform

Code which manages configuration and life-cycle of the AWS OIDC for HCP Terraform. It is designed to be used locally with the state stored in a dedicated CLI-Driven Terraform workspace.

## Permissions

## Authentication

## Features

## Documentation

## Requirements

The following requirements are needed by this module:

- <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) (> 1.3.1)

- <a name="requirement_aws"></a> [aws](#requirement\_aws) (5.23.1)

- <a name="requirement_tls"></a> [tls](#requirement\_tls) (4.0.4)

## Modules

No modules.

## Required Inputs

No required inputs.

## Optional Inputs

The following input variables are optional (have default values):

### <a name="input_tfc_hostname"></a> [tfc\_hostname](#input\_tfc\_hostname)

Description: (Optional) The address of the HCP Terraform instance.

Type: `string`

Default: `"app.terraform.io"`

### <a name="input_tfc_organization_name"></a> [tfc\_organization\_name](#input\_tfc\_organization\_name)

Description: (Required) The name of the HCP Terraform organization.

Type: `string`

Default: `"benoitblais-hashicorp"`

### <a name="input_tfc_project_name"></a> [tfc\_project\_name](#input\_tfc\_project\_name)

Description: (Required) The name of the HCP Terraform project.

Type: `string`

Default: `"*"`

### <a name="input_tfc_workspace_name"></a> [tfc\_workspace\_name](#input\_tfc\_workspace\_name)

Description: (Required) The name of the HCP Terraform workspace.

Type: `string`

Default: `"*"`

## Resources

The following resources are used by this module:

- [aws_iam_openid_connect_provider.tfc_provider](https://registry.terraform.io/providers/hashicorp/aws/5.23.1/docs/resources/iam_openid_connect_provider) (resource)
- [aws_iam_policy.tfc_policy](https://registry.terraform.io/providers/hashicorp/aws/5.23.1/docs/resources/iam_policy) (resource)
- [aws_iam_role.hcp_terraform](https://registry.terraform.io/providers/hashicorp/aws/5.23.1/docs/resources/iam_role) (resource)
- [aws_iam_role_policy_attachment.tfc_policy_attachment](https://registry.terraform.io/providers/hashicorp/aws/5.23.1/docs/resources/iam_role_policy_attachment) (resource)
- [tls_certificate.tfc_certificate](https://registry.terraform.io/providers/hashicorp/tls/4.0.4/docs/data-sources/certificate) (data source)

## Outputs

The following outputs are exported:

### <a name="output_arn"></a> [arn](#output\_arn)

Description: Amazon Resource Name (ARN) specifying the role.

<!-- markdownlint-enable -->
<!-- END_TF_DOCS -->