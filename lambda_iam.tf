data "aws_iam_policy_document" "lambda_iam" {
  statement {
    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "lambda_iam" {
  name               = "lambda-iam"
  assume_role_policy = data.aws_iam_policy_document.lambda_iam.json
}
