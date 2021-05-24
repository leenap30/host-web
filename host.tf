resource "aws_s3_bucket" "b" {
  bucket = "awsbucketl1"
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
