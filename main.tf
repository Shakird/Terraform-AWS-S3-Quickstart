resource "aws_s3_bucket" ""{
  bucket  = "<Bucketname>"
  acl = "private"

  tags = {
     Name = "Bucket1"
     Environment = "Test"
   }

  website {
    index_document = "index.html"
    error_document = "error.html"

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