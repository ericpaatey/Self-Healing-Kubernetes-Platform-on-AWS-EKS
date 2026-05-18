resource "aws_cloudwatch_metric_alarm" "pod_restart_alarm" {

  alarm_name = "${var.environment}-pod-restart-alarm"

  comparison_operator = "GreaterThanThreshold"

  evaluation_periods = 1

  metric_name = "pod_restart_count"

  namespace = "ContainerInsights"

  period = 60

  statistic = "Average"

  threshold = 5

  alarm_description = "Triggers remediation when pods restart excessively"

  alarm_actions = [
    aws_lambda_function.remediation_lambda.arn
  ]
}