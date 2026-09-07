resource "aws_subnet" "public" {
  count = length(var.vpc.public_subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.vpc.public_subnets[count.index].cidr_block
  availability_zone       = var.vpc.public_subnets[count.index].availability_zone
  map_public_ip_on_launch = true

  tags = {
    Name = var.vpc.public_subnets[count.index].name
  }
}

# resource "aws_subnet" "public_us_east_1b" {
#   vpc_id                    = aws_vpc.this.id
#   cidr_block                = "10.0.0.64/26"
#   availability_zone         = "us-east-1b"
#   map_public_ip_on_launch   = true

#   tags = {
#     Name = "Main"
#   }
# }