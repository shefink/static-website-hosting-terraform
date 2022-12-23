provider "aws" {
  version = "~>3.0"
  region = "us-east-1"
}
resource "aws_s3_bucket" "s3" {
  bucket = "12-23-2002"
}
resource "aws_s3_bucket_policy" "policy" {
  bucket = aws_s3_bucket.s3.id
  policy = file("policy.json")
}
resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.s3.id
  index_document {
    suffix = "index.html"
  }
}
resource "aws_s3_bucket_acl" "example_bucket_acl" {
  bucket = aws_s3_bucket.s3.id
  acl    = "public-read"
}
output "s3-website-url" {
  value = aws_s3_bucket_website_configuration.website.website_endpoint
}
