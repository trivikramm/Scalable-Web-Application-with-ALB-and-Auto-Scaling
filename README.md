
# Scalable Web Application with ALB and Auto Scaling

This project deploys a simple, scalable, and highly available web application on AWS using Terraform.

## Architecture

The architecture consists of the following components:
- **VPC**: A dedicated Virtual Private Cloud (VPC) for the application.
- **Public Subnets**: Two public subnets in different Availability Zones for high availability.
- **Internet Gateway**: To provide internet access to the VPC.
- **Route Table**: To route traffic from the subnets to the internet.
- **Security Group**: A security group to control traffic to the EC2 instances.
- **IAM Role**: An IAM role for the EC2 instances to allow access to other AWS services.
- **Launch Template**: A launch template to define the configuration of the EC2 instances.
- **Application Load Balancer (ALB)**: To distribute incoming traffic across the EC2 instances.
- **Auto Scaling Group (ASG)**: To automatically scale the number of EC2 instances based on CPU utilization.
- **CloudWatch Alarm**: A CloudWatch alarm to monitor the CPU utilization of the EC2 instances.
- **SNS Topic**: An SNS topic to send notifications when the CloudWatch alarm is triggered.

## Prerequisites

- [Terraform](httpss://www.terraform.io/downloads.html) installed.
- [AWS CLI](httpss://aws.amazon.com/cli/) installed and configured with your AWS credentials.
- An AWS key pair created in your desired region.

## Deployment

1. **Clone the repository:**
   ```sh
   git clone https://github.com/your-username/scalable-web-app.git
   cd scalable-web-app
   ```

2. **Update `variables.tf`:**
   - `key_name`: Set to the name of your AWS key pair.
   - `notification_email`: Set to your email address for SNS notifications.

3. **Initialize Terraform:**
   ```sh
   terraform init
   ```

4. **Apply the Terraform configuration:**
   ```sh
   terraform apply
   ```
   Enter `yes` when prompted to confirm the deployment.

5. **Access the web application:**
   - After the deployment is complete, Terraform will output the DNS name of the ALB.
   - Open the ALB DNS name in your web browser to see the "Hello World" message.

## Cleanup

To destroy the resources created by this project, run the following command:
```sh
terraform destroy
```
Enter `yes` when prompted to confirm the deletion.
