terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  # Uncomment after Dynamo and S3 state created. do: terraform init.
  backend "s3" {
    bucket         = "506912659220-test-demo-tf-state" # From output s3_state_bucket (e.g., 123456789012-test-demo-tf-state)
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "test-demo-tf-locks" # From output dynamodb_lock_table
    encrypt        = true
  }
  # Uncomment end.
}

provider "aws" {
  region = var.aws_region
}
