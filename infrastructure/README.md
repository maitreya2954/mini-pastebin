# Mini Pastebin Cloud Infrastructure

This repository contains the **Terraform** code to provision the cloud infrastructure for the **Mini Pastebin** application. The infrastructure is set up on **AWS** and includes:

- **EKS** (Elastic Kubernetes Service) for running the application containers.
- **ECR** (Elastic Container Registry) for storing Docker images.
- **RDS** (Relational Database Service) for PostgreSQL.
- **S3** for static assets storage.
- **IAM Roles and Policies** for securing access to resources.
- **VPC** (Virtual Private Cloud) for networking resources, with subnets across multiple Availability Zones (AZs).

## Infrastructure Components

1. **VPC (Virtual Private Cloud)**:
   - Custom VPC with public and private subnets across multiple Availability Zones for high availability.
   - Internet Gateway and NAT Gateway setup for public and private subnets.

2. **EKS (Elastic Kubernetes Service)**:
   - EKS Cluster for managing Kubernetes workloads.
   - Node group with 3 nodes distributed across multiple AZs.
   - The application containers (backend and frontend) will be deployed using Kubernetes in this cluster.

3. **ECR (Elastic Container Registry)**:
   - ECR is used to store Docker images for the backend and frontend services.

4. **RDS (PostgreSQL)**:
   - A PostgreSQL database hosted on RDS for storing the application's data.
   - The database is deployed in private subnets.

5. **S3 (Simple Storage Service)**:
   - S3 bucket for storing static assets such as images or logs.

6. **IAM Roles and Policies**:
   - IAM roles and policies for EKS, nodes, and other AWS resources to ensure secure access.

## Prerequisites

To deploy the infrastructure, you need the following:

- [Terraform](https://www.terraform.io/downloads.html) installed.
- AWS account with credentials set up via the AWS CLI (`aws configure`).
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) installed to interact with the EKS cluster.
- [AWS CLI](https://aws.amazon.com/cli/) installed and configured with appropriate permissions.

## Folder Structure

```
mini-pastebin-infrastructure/
├── main.tf               # Main Terraform file
├── variables.tf          # Global variable definitions
├── outputs.tf            # Global output definitions
├── eks/                  # EKS module configuration
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── ecr/                  # ECR module configuration
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── vpc/                  # VPC module configuration
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── rds/                  # RDS module configuration
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
├── s3/                   # S3 module configuration
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
└── iam/                  # IAM roles and policies module
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
```

## Deployment Instructions

1. **Clone the Repository**:

   Clone the infrastructure repository to your local machine:

   ```bash
   git clone https://github.com/maitreya2954/infrastructure.git
   cd infrastructure
   ```

2. **Configure Environment Variables**:

   Ensure your AWS credentials are properly set up, either using the AWS CLI (`aws configure`) or by setting environment variables for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`.

3. **Initialize Terraform**:

   Initialize Terraform to download the necessary provider and module dependencies:

   ```bash
   terraform init
   ```

4. **Deploy the Infrastructure**:

   Run the following command to deploy the infrastructure:

   ```bash
   terraform apply
   ```

   Terraform will display a plan of the infrastructure changes. Type `yes` to approve and deploy the resources.

5. **Access the Kubernetes Cluster**:

   Once the infrastructure is deployed, configure your local `kubectl` to interact with the EKS cluster:

   ```bash
   aws eks --region <aws-region> update-kubeconfig --name <eks-cluster-name>
   ```

   Now you can use `kubectl` commands to interact with the Kubernetes cluster.

6. **Push Docker Images to ECR**:

   Build and push Docker images for your application (frontend and backend) to the ECR repository:

   ```bash
   # Authenticate Docker to ECR
   aws ecr get-login-password --region <aws-region> | docker login --username AWS --password-stdin <account-id>.dkr.ecr.<aws-region>.amazonaws.com

   # Build and tag your Docker image
   docker build -t mini-pastebin .
   docker tag mini-pastebin:latest <account-id>.dkr.ecr.<aws-region>.amazonaws.com/mini-pastebin-repo:latest

   # Push the image to ECR
   docker push <account-id>.dkr.ecr.<aws-region>.amazonaws.com/mini-pastebin-repo:latest
   ```

## Outputs

Once the infrastructure is deployed, Terraform will output the following important information:

- **VPC ID**: The ID of the created VPC.
- **EKS Cluster Endpoint**: The API endpoint of the EKS cluster.
- **RDS Endpoint**: The connection string for the PostgreSQL database.
- **ECR Repository URL**: The URL of the Elastic Container Registry for Docker images.
- **S3 Bucket Name**: The name of the S3 bucket for static assets.

## Cleanup

To destroy all the resources created by Terraform, run:

```bash
terraform destroy
```
