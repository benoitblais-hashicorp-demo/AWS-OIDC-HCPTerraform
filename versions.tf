# Configure the minimum required providers supported

terraform {

  cloud { 
    
    organization = "benoitblais-hashicorp" 

    workspaces { 
      name = "aws-oidc-hcpterraform" 
    } 
  } 

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.23.1"
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.4"
    }

  }

  required_version = "> 1.3.1"

}
