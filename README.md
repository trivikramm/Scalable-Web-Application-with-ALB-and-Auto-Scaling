
# Scalable Web Application with ALB and Auto Scaling

This project deploys a highly available and scalable web application on AWS using Terraform. The infrastructure is designed to automatically handle changes in traffic by scaling the number of instances up or down, ensuring a consistent user experience.

## Features

- **High Availability**: Deployed across multiple Availability Zones to ensure the application remains available even if one zone fails.
- **Scalability**: Automatically scales the number of EC2 instances based on CPU load, ensuring optimal performance and cost-efficiency.
- **Automated Deployment**: Infrastructure is provisioned and managed using Terraform, allowing for repeatable and consistent deployments.
- **Secure**: Uses security groups to control access to the instances and a dedicated VPC for network isolation.

## Architecture

The following diagram illustrates the architecture of the web application:

```mermaid
graph TD
    subgraph "User"
        User[Internet User]
    end

    subgraph "AWS Infrastructure"
        subgraph "VPC"
            ALB[Application Load Balancer]
            ASG[Auto Scaling Group]
            IGW[Internet Gateway]
            RT[Route Table]
            SG[Security Group]

            subgraph "Public Subnet (AZ-a)"
                EC2_A[EC2 Instance]
            end
            subgraph "Public Subnet (AZ-b)"
                EC2_B[EC2 Instance]
            end
        end
    end

    User -- HTTP Request --> IGW
    IGW -- Routes via --> RT
    RT -- Forwards to --> ALB
    ALB -- Distributes Traffic --> ASG
    ASG -- Manages --> EC2_A
    ASG -- Manages --> EC2_B

    EC2_A -- Serves Content --> ALB
    EC2_B -- Serves Content --> ALB

    SG -- Allows HTTP/SSH Inbound --> ALB
    SG -- Allows HTTP/SSH Inbound --> EC2_A
    SG -- Allows HTTP/SSH Inbound --> EC2_B
```

## Prerequisites

Before you begin, ensure you have the following installed and configured:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)
- An AWS account with the necessary permissions
- A configured AWS credentials profile

## Getting Started

Follow these steps to deploy the application.

### 1. Clone the Repository

Clone this repository to your local machine:

```sh
git clone https://github.com/trivikramm/Scalable-Web-Application-with-ALB-and-Auto-Scaling.git
cd Scalable-Web-Application-with-ALB-and-Auto-Scaling
```

### 2. Configure Variables

Update the `variables.tf` file with your specific details. At a minimum, you should set the `aws_region`.

### 3. Initialize Terraform

Initialize the Terraform working directory to download the necessary providers:

```sh
terraform init
```

### 4. Plan the Deployment

Run `terraform plan` to see the resources that will be created:

```sh
terraform plan
```

### 5. Apply the Configuration

Deploy the infrastructure using the `terraform apply` command:

```sh
terraform apply --auto-approve
```

## Accessing the Application

Once the deployment is complete, Terraform will output the DNS name of the Application Load Balancer. You can access the web application by pasting this URL into your browser.

## Cleaning Up

To avoid incurring future charges, destroy the resources you created:

```sh
terraform destroy --auto-approve
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request with your improvements.
