data "aws_sns_topic" "selected" {
  name = var.sns_name
}

# Fetch the instance ID using the instance name (for EC2)
data "aws_instance" "selected" {
  count = var.service_type == "EC2" ? 1 : 0

  filter {
    name   = "tag:Name"
    values = [var.instance_name]
  }
  most_recent = true
}

# Fetch the DB instance ID using the instance name (for RDS)
data "aws_db_instance" "selected" {
  count = var.service_type == "RDS" ? 1 : 0

  filter {
    name   = "db-instance-id"
    values = [var.instance_name]
  }
}

# Determine dimensions based on service type
locals {
  dimensions = var.service_type == "EC2" ? { InstanceId = data.aws_instance.selected[0].id } :
               var.service_type == "RDS" ? { DBInstanceIdentifier = data.aws_db_instance.selected[0].id } :
               {}
}

resource "aws_cloudwatch_metric_alarm" "example" {
  alarm_name                = "${var.instance_name}-${var.metric_name}-alarm"
  comparison_operator       = var.comparison_operator
  evaluation_periods        = var.evaluation_periods
  metric_name               = var.metric_name
  namespace                 = var.namespace
  period                    = var.period
  statistic                 = "Average"
  threshold                 = var.threshold
  alarm_description         = "Alarm for ${var.instance_name} on metric ${var.metric_name}"
  actions_enabled           = true
  alarm_actions             = [data.aws_sns_topic.selected.arn]
  ok_actions                = [data.aws_sns_topic.selected.arn]
  insufficient_data_actions = [data.aws_sns_topic.selected.arn]
  dimensions                = local.dimensions

  lifecycle {
    create_before_destroy = true
  }
}
