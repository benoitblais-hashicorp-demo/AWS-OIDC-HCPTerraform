data "tls_certificate" "tfc_certificate" {
  url = "https://${var.tfc_hostname}"
}

# The following resource block is used to create an IAM OpenID Connect provider resource.

# Since this resource is already created, we will import it into our Terraform state.
# import {
#   to = aws_iam_openid_connect_provider.tfc_provider
#   id = "arn:aws:iam::353671346900:oidc-provider/app.terraform.io"
# }

resource "aws_iam_openid_connect_provider" "tfc_provider" {
  url             = data.tls_certificate.tfc_certificate.url
  client_id_list  = ["aws.workload.identity"]
  thumbprint_list = [data.tls_certificate.tfc_certificate.certificates[0].sha1_fingerprint]

  lifecycle {
    ignore_changes = [tags] # This is because this resource is managed outside of Terraform.
  }
}

# The following resource block is used to create an IAM OpenID Connect provider resource.

resource "aws_iam_role" "hcp_terraform" {
  name = "tfc-${var.tfc_organization_name}"

  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Effect": "Allow",
     "Principal": {
       "Federated": "${aws_iam_openid_connect_provider.tfc_provider.arn}"
     },
     "Action": "sts:AssumeRoleWithWebIdentity",
     "Condition": {
       "StringEquals": {
         "${var.tfc_hostname}:aud": "${one(aws_iam_openid_connect_provider.tfc_provider.client_id_list)}"
       },
       "StringLike": {
         "${var.tfc_hostname}:sub": "organization:${var.tfc_organization_name}:project:${var.tfc_project_name}:workspace:${var.tfc_workspace_name}:run_phase:*"
       }
     }
   }
 ]
}
EOF
}

# The following resource block is used to create an IAM policy.

resource "aws_iam_policy" "tfc_policy" {
  name        = "tfc-policy"
  description = "TFC run policy"

  policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
   {
     "Effect": "Allow",
     "Action": [
       "*"
     ],
     "Resource": "*"
   }
 ]
}
EOF
}

# The following resource block is used to attache a managed IAM policy to an IAM role.

resource "aws_iam_role_policy_attachment" "tfc_policy_attachment" {
  role       = aws_iam_role.hcp_terraform.name
  policy_arn = aws_iam_policy.tfc_policy.arn
}
