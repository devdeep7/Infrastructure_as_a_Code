resource "aws_key_pair" "prod" {
key_name = "prod-key"
public_key = "${file(var.MY-PUB-KEY)}"
}
