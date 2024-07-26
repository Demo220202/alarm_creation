provider "aws" {
  region = var.region
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "1"
  metric_name         = var.metric_name
  namespace           = "EC2"
  period              = "300"
  statistic           = "Average"
  threshold           = var.threshold

  dimensions = {
    InstanceId = var.instance_id
  }

  alarm_description = "This metric monitors the ${var.metric_name} for instance ${var.instance_id}"
  actions_enabled   = true
  alarm_actions     = [var.sns_topic_arn]
  ok_actions        = [var.sns_topic_arn]
  insufficient_data_actions = [var.sns_topic_arn]
}
