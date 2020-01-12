resource "aws_iam_group" "developers" {
name ="developers"
}

resource "aws_iam_policy_attachment" "read-only" {
name = "read-only-developers"
groups = ["${aws_iam_group.developers.name}"]
policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

resource "aws_iam_user" "MevProd" {
name = "dev1"
}

resource "aws_iam_group_membership" "dev" {
name = "dev"
users = ["${aws_iam_user.MevProd.name}"]
group = "${aws_iam_group.developers.name}"
}

