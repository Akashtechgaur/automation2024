data "aws_availability_zones" "this" {
  all_availability_zones = true

  filter {
    name   = "opt-in-status"
    values = ["not-opted-in-required"]
  }
}