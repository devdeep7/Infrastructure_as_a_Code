variable "AWS_ACCESS_KEY"{}
variable "AWS_SECRET_KEY"{}
variable "region" {
default = "us-east-1"
}
variable "AMIS"{
	type = "map"
	default = {
		us-east-1 = "ami-04763b3055de4860b"
		us-west-w = ""
}
}
variable "MY-PUB-KEY"{
	default = "mykey.pub"
}
