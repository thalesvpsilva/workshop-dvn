data "aws_subnets" "private" {
  filter {
    name   = "tag:Project"
    values = ["workshop-dvn"]
  }

  filter {
    name   = "tag:Environment"
    values = ["production"]
  }

  filter {
    name   = "map-public-ip-on-launch"
    values = [false]
  }
}