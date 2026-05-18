resource "aws_sns_topic" "alerts" {

  name = "${var.environment}-self-healing-alerts"
}