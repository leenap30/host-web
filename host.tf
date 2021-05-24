provider "aws" {
  region = "us-east-2"
}
resource "aws_s3_bucket_object" "object" {

  bucket = "awsbucketleena4"
  
  key    = "profile"

  acl    = "public-read"

  source = "index.html

  etag = filemd5("index.html")

}

resource "aws_s3_bucket" "b" {
  bucket = "awsbucketleena4"
  acl    = "public-read"
  policy = file("policy.json")

  website {
    index_document = "index.html"

    routing_rules = <<EOF
[{
    "Condition": {
        "KeyPrefixEquals": "docs/"
    },
    "Redirect": {
        "ReplaceKeyPrefixWith": "documents/"
    }
}]
EOF
  }
}
