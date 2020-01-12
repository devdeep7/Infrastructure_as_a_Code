resource "aws_security_group" "allow-ssh" {
	name = "allow-ssh"
	description = "allow ssh traffic"
	vpc_id = "${aws_vpc.main.id}"
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["103.99.202.60/32","100.8.220.57/32","198.179.82.250/32"]
	}
	
	 ingress {
                from_port = 80
                to_port = 80
                protocol = "tcp"
                cidr_blocks = ["103.99.202.60/32","100.8.220.57/32","198.179.82.250/32"]
        }
	
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	tags = {
		name = "allow-ssh"
	}

}
