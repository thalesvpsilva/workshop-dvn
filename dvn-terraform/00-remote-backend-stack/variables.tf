variable "default_tags" {
  type = object({
    Project     = string
    Environment = string
  })

  default = {
    Project     = "workshop-dvn"
    Environment = "production"
  }
}

variable "assume_role" {
  type = object({
    arn    = string
    region = string
  })

  default = {
    arn    = "arn:aws:iam::874026451845:role/workshop-dvn-role"
    region = "us-east-1"
  }
}

variable "remote_backend" {
  type = object({
    dynamodb_table_name    = string
    dynamodb_billing_mode  = string
    dynamodb_hash_key      = string
    dynamodb_hash_key_type = string
    bucket                 = string
  })

  default = {
    dynamodb_table_name    = "workshop-dvn-state-locking-table"
    dynamodb_billing_mode  = "PAY_PER_REQUEST"
    dynamodb_hash_key      = "LockID"
    dynamodb_hash_key_type = "S"
    bucket                 = "workshop-dvn-remote-backend-bucket-thales"
  }
}