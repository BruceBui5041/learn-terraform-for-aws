terraform {
  /* NOTE:
  # allow 5.19.xx, 5.20.xx
  # deny 5.18.xx, 5.17.xx
  */
  required_version = "~> 1.5.7"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region  = "ap-southeast-1"
  profile = "default"
}
