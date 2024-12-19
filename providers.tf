# Configure Terraform Cloud and AWS Provider
terraform {
  cloud {
    organization = "entrata"
    workspaces {
      name = "vitaliy-sandbox-terraform"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
  assume_role {
    role_arn     = "arn:aws:iam::${var.account_number}:role/terraform-cloud"
    session_name = "terraform"
  }

  default_tags {
    tags = {
      "owner:department" = var.tag_owner-department
      "owner:name"       = var.tag_owner-name
      "owner:contact"    = var.tag_owner-contact
      "creator:method"   = var.tag_creator-method
      "ent:env"         = var.tag_environment
      "map-migrated"    = var.map_tag
    }
  }
}
