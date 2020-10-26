resource "aws_iam_role" "lambda_iam" {
  name = "lambda_iam"

  assume_role_policy = file("lambda_assume_role_policy.json")
}
