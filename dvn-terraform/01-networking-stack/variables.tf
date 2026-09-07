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


variable "vpc" {
  type = object({
    name                     = string
    cidr_block               = string
    internet_gateway_name    = string
    public_route_table_name  = string
    private_route_table_name = string
    nat_gateway_name         = string
    public_subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
    private_subnets = list(object({
      name              = string
      cidr_block        = string
      availability_zone = string
    }))
  })

  default = {
    name                     = "workshop-dvn-vpc"
    cidr_block               = "10.0.0.0/24"
    internet_gateway_name    = "workshop-dvn-igw"
    public_route_table_name  = "workshop-dvn-public-route-table"
    private_route_table_name = "workshop-dvn-private-route-table"
    nat_gateway_name         = "workshop-dvn-nat-gateway"
    public_subnets = [
      {
        name              = "public-us-east-1a"
        cidr_block        = "10.0.0.0/26"
        availability_zone = "us-east-1a"
      },
      {
        name              = "public-us-east-1b"
        cidr_block        = "10.0.0.64/26"
        availability_zone = "us-east-1b"
      }
    ]
    private_subnets = [
      {
        name              = "private-us-east-1a"
        cidr_block        = "10.0.0.128/26"
        availability_zone = "us-east-1a"
      },
      {
        name              = "private-us-east-1b"
        cidr_block        = "10.0.0.192/26"
        availability_zone = "us-east-1b"
      }
    ]
  }
}
