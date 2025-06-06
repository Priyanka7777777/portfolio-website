provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "portfolio" {
  bucket = "priyanka-portfolio-bucket"
  force_destroy = true
}

resource "aws_s3_bucket_website_configuration" "portfolio_website" {
  bucket = aws_s3_bucket.portfolio.id

  index_document {
    suffix = "index.html"
  }

  error_document {
    key = "index.html"
  }
}

resource "aws_s3_bucket_policy" "public_read" {
  bucket = aws_s3_bucket.portfolio.id
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Sid = "PublicReadGetObject",
      Effect = "Allow",
      Principal = "*",
      Action = "s3:GetObject",
      Resource = "${aws_s3_bucket.portfolio.arn}/*"
    }]
  })
}
