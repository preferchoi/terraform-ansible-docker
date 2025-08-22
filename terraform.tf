terraform {
    required_provider {
        aws = {
            source = "hashicorp/aws"
            version = "~> 5.92"
        }
    }

    required_version = ">= 1.2"
}