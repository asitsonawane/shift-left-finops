provider "aws" {
  region = "us-east-1"
}

resource "random_id" "suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "example" {
  bucket = "infracost-test-bucket-${random_id.suffix.hex}"
  acl    = "private"
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0" # Amazon Linux 2 AMI (us-east-1)
  instance_type = "t3.micro"
} 