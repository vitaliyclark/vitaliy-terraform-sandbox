# Terraform Sandbox for Entrata

This repository contains Terraform configurations for AWS infrastructure at Entrata.

## Repository Structure

```
.
├── environments/           # Environment-specific configurations
│   └── sandbox/           # Sandbox environment
│       └── s3/           # S3 bucket example
│           ├── main.tf           # Main Terraform configuration
│           ├── providers.tf      # Provider configuration
│           └── variables.tf      # Variable definitions
│
└── modules/              # Reusable Terraform modules (future use)
```

## Usage

1. Ensure you have access to:
   - Terraform Cloud (through Okta)
   - AWS Develop account
   - The terraform-cloud role in AWS

2. The workflow is:
   - Make changes to Terraform files
   - Commit and push to the main branch
   - Terraform Cloud will automatically:
     1. Run a "Plan" to show what will change
     2. Wait for approval
     3. Run "Apply" to make the changes

## Current Resources

- S3 bucket with:
  - Versioning enabled
  - Server-side encryption
  - SSL enforcement
  - Proper Entrata tagging

## Best Practices

- All infrastructure changes are tracked in version control
- Uses Terraform Cloud for state management
- Follows Entrata's tagging requirements
- Uses assume_role for AWS access (no AWS keys in code)
