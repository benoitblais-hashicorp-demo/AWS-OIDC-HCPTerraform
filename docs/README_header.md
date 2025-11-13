# AWS OIDC HCP Terraform

Code which manages configuration and life-cycle of the AWS OIDC for HCP Terraform. It is designed to be used locally with the state stored in a dedicated CLI-Driven Terraform workspace.

## Permissions

### AWS Permission

To manage resources, provide credentials with appropriate permissions. 

* You need permissions to create an OpenID Connect (OIDC) identity provider in AWS IAM. This
typically requires actions like `iam:CreateOpenIDConnectProvider` and `iam:AddClientIDToOpenIDConnectProvider`.
* You need permissions to create and modify IAM roles, including the ability to define trust
policies that allow the OIDC provider to assume the role. This involves actions like `iam:CreateRole`,
`iam:PutRolePolicy`, and `iam:AttachRolePolicy`.
* You need permissions to create and manage IAM policies that define the specific AWS API actions the assumed
role can perform. This includes actions like `iam:CreatePolicy`, `iam:PutRolePolicy`, and `iam:AttachRolePolicy`.

## Authentication

### AWS Authentication

The AWS provider requires credentials in order to manage resources.

There are several ways to provide the required credentials:

* Credentials can be provided by adding an `access_key`, `secret_key`, and optionally `token`, to the aws provider block.
* Credentials can be provided by using the `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, and optionally `AWS_SESSION_TOKEN`
environment variables. The Region can be set using the `AWS_REGION` or `AWS_DEFAULT_REGION` environment variables.

## Features

* Create and manage Identity Provider
* Create and manage IAM Role
* Create and manage IAM Policy
* Attache IAM Policy to IAM Role
