variable "alarm_name" {
  description = "The name of the CloudWatch alarm."
  type        = string
}

variable "metric_name" {
  description = "The name of the CloudWatch metric."
  type        = string
}

variable "instance_id" {
  description = "The ID of the instance to monitor."
  type        = string
}

variable "threshold" {
  description = "The threshold at which to trigger the alarm."
  type        = number
}

variable "region" {
  description = "The AWS region to use."
  type        = string
}

variable "alarm_state" {
  description = "The state in which to set the alarm."
  type        = string
}

variable "sns_topic_arn" {
  description = "The ARN of the SNS topic for alarm notifications."
  type        = string
}

variable "namespace" {
  description = "The namespace of the CloudWatch metric."
  type        = string
}
