resource "aws_instance" "prod" {
instance_type = "t3a.xlarge"
ami = "${lookup(var.AMIS, var.region)}"

subnet_id = "${aws_subnet.main-public-1.id}"
vpc_security_group_ids = ["${aws_security_group.allow-ssh.id}"]
key_name = "${aws_key_pair.prod.key_name}"
}

resource "aws_eip" "instance-pub-ip"{
instance = "${aws_instance.prod.id}"
vpc = "true"
}


resource "aws_ebs_volume" "ebs-volume-1" {
availability_zone = "us-east-1a"
size = 100
type = "gp2"
tags = {
	name = "extra volume data"
}
}

resource "aws_volume_attachment" "ebs-volume-1-attachment" {
device_name  = "/dev/sdh"
volume_id = "${aws_ebs_volume.ebs-volume-1.id}"
instance_id = "${aws_instance.prod.id}"
}

