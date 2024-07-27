variable "instance_name" {
  description = "Name of the instance (EC2, RDS, etc.)"
  type        = string
}

variable "sns_name" {
  description = "Name of the SNS topic"
  type        = string
}

variable "metric_name" {
  description = "Name of the metric"
  type        = string
}

variable "namespace" {
  description = "Namespace of the metric"
  type        = string
}

variable "threshold" {
  description = "Threshold for the alarm"
  type        = number
}

variable "comparison_operator" {
  description = "Comparison operator for the alarm"
  type        = string
  default     = "GreaterThanThreshold"
}

variable "evaluation_periods" {
  description = "Number of evaluation periods"
  type        = number
  default     = 1
}

variable "period" {
  description = "Period in seconds"
  type        = number
  default     = 300
}

variable "service_type" {
  description = "Type of the service (EC2, RDS, etc.)"
  type        = string
}
