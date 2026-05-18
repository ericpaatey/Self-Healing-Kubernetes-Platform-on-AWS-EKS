resource "aws_lambda_function" "remediation_lambda" {

  function_name = "${var.environment}-remediation-function"

  role = aws_iam_role.lambda_role.arn

  runtime = "python3.11"

  handler = "remediation.lambda_handler"

  filename = "../lambda/remediation.zip"

  timeout = 60

  environment {
    variables = {
      CLUSTER_NAME = module.eks.cluster_name
      SNS_TOPIC    = aws_sns_topic.alerts.arn
    }
  }
}