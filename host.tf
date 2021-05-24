provider "aws" {
  region = "us-east-2"
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
