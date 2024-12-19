# Create an S3 bucket as a simple example
resource "aws_s3_bucket" "test_bucket" {
  # Bucket names must be globally unique across all AWS accounts
  bucket = "vitaliy-terraform-test-${var.account_number}"

  # Enable versioning for the bucket
  versioning {
    enabled = true
  }

  # Add server-side encryption by default
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

# Add bucket policy to enforce SSL
resource "aws_s3_bucket_policy" "bucket_policy" {
  bucket = aws_s3_bucket.test_bucket.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "ForceSSLOnly"
        Effect    = "Deny"
        Principal = "*"
        Action    = "s3:*"
        Resource = [
          aws_s3_bucket.test_bucket.arn,
          "${aws_s3_bucket.test_bucket.arn}/*"
        ]
        Condition = {
          Bool = {
            "aws:SecureTransport" = "false"
          }
        }
      }
    ]
  })
}

# Output the bucket name and ARN
output "bucket_name" {
  value = aws_s3_bucket.test_bucket.id
}

output "bucket_arn" {
  value = aws_s3_bucket.test_bucket.arn
}
