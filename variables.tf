
variable "aws_region" {
  description = "The AWS region to deploy resources in."
  default     = "us-east-1"
}

variable "instance_type" {
  description = "The instance type for the EC2 instances."
  default     = "t2.micro"
}

variable "key_name" {
  description = "The name of the key pair to use for the EC2 instances."
  default     = "my-app-key" # Replace with your key pair name
}

variable "notification_email" {
  description = "The email address for SNS notifications."
  default     = "trivikram100699@gmail.com" # Replace with your email
}
