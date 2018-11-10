locals {
  subnet_count       = 3
  availability_zones = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

resource "aws_subnet" "terraform-b-g" {
  count                   = "${local.subnet_count}"
  vpc_id                  = "${var.vpc_id}"
  availability_zone       = "${element(local.availability_zones, count.index)}"
  cidr_block              = "10.0.${local.subnet_count * (var.infrastructure_version - 1) + count.index + 1}.0/24"
  map_public_ip_on_launch = true

  tags {
    Name = "${element(local.availability_zones, count.index)} (v${var.infrastructure_version})"
  }
}
