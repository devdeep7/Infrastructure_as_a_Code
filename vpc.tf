resource "aws_vpc" "main" {
cidr_block = "10.0.0.0/16"
tags = {
	Name = "main"
}
}

resource "aws_subnet" "main-public-1" {
vpc_id = "${aws_vpc.main.id}"
cidr_block = "10.0.0.0/24"
map_public_ip_on_launch = "true"
availability_zone = "us-east-1a"
tags = {
	name = "main-public-1"
	 }
}

resource "aws_internet_gateway" "gw" {
vpc_id = "${aws_vpc.main.id}"
}

resource "aws_route_table" "main-public" {
vpc_id = "${aws_vpc.main.id}"
route  {
	cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.gw.id}"
}
tags = {
	name = "main-public-ip"
}
}
resource "aws_route_table_association" "a" {
subnet_id = "${aws_subnet.main-public-1.id}"
route_table_id = "${aws_route_table.main-public .id}"
}


