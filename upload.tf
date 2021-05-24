resource "aws_s3_bucket_object" "object" {

  bucket = "awsbucketleena4"
  
  key    = "profile"

  acl    = "public-read"

  source = "index.html

  etag = filemd5("index.html")

}
