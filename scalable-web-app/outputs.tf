
output "alb_dns_name" {
  description = "The DNS name of the Application Load Balancer."
  value       = aws_alb.main.dns_name
}

output "asg_name" {
  description = "The name of the Auto Scaling Group."
  value       = aws_autoscaling_group.web_asg.name
}

output "sns_topic_arn" {
  description = "The ARN of the SNS topic for alerts."
  value       = aws_sns_topic.alerts.arn
}
