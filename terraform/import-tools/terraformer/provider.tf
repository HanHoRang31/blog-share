provider "aws" {
  region                   = "ap-northeast-2"
  shared_config_files      = ["~/.aws/config"]
  shared_credentials_files = ["~/.aws/credentials"]
}

terraform {
	required_providers {
		aws = {
	    version = "~> 5.14.0"
		}
  }
}
