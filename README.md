
# Mini Pastebin Application

The **Mini Pastebin** is a full-stack web application that allows users to create, view, edit, and delete code snippets. This project consists of both a **frontend** (React) and a **backend** (Node.js/Express), with the entire infrastructure running on **AWS** using **EKS (Elastic Kubernetes Service)** and **AWS ECR** for Docker image storage.

This repository covers:
- **Frontend**: A React app that interacts with the backend to manage code snippets.
- **Backend**: A Node.js/Express app that handles the API requests and connects to a PostgreSQL database.
- **Infrastructure**: All services are containerized and deployed using **Kubernetes** on **AWS EKS**. The infrastructure setup is automated using **Terraform**.
- **CI/CD Pipeline**: The project uses GitHub Actions to automate the build, testing, Docker image push to **AWS ECR**, and deployment to **AWS EKS**.

## Features

- Create, view, edit, and delete code snippets.
- Frontend is built using **React**.
- Backend is built using **Node.js** and **Express**.
- **PostgreSQL** is used as the database.
- **AWS EKS** is used to host the Kubernetes cluster.
- **AWS ECR** is used to store Docker images.
- **CI/CD** pipeline automates the entire process from code push to deployment.


## Prerequisites

To work with the project, you need:

- **AWS Account**: Set up and configure AWS CLI.
- **Docker**: Installed on your machine for building images.
- **Terraform**: To provision the AWS infrastructure (EKS, ECR, etc.).
- **kubectl**: To manage your Kubernetes cluster.
- **Node.js**: To run the backend locally if needed.

## Database

PostgreSQL is used as the database, and the schema is managed using Sequelize ORM.

    Table: snippets
        id: Primary key
        title: Title of the snippet
        content: Code content
        language: Programming language of the snippet


## Setup Instructions

### 1. Infrastructure Setup with Terraform

The cloud infrastructure for the application (VPC, EKS cluster, RDS, ECR) is managed by Terraform. You can find the Terraform configurations in the `mini-pastebin-infrastructure` repository.

1. **Initialize and apply Terraform configurations**:

   ```bash
   terraform init
   terraform apply
   ```

2. **Create and Push Docker Images to AWS ECR**

   After the ECR repository is created by Terraform, build and push Docker images for both frontend and backend.

   ```bash
   # Backend
   docker build -t <your-ecr-backend-repo-url> ./mini-pastebin-backend
   docker push <your-ecr-backend-repo-url>

   # Frontend
   docker build -t <your-ecr-frontend-repo-url> ./mini-pastebin-frontend
   docker push <your-ecr-frontend-repo-url>
   ```

### 2. Local Development

You can run the application locally using Docker Compose:

```bash
docker-compose up --build
```

### 3. Deploy to Kubernetes (EKS)

Make sure the **Kubernetes manifests** (`k8s/`) are applied to your EKS cluster.

```bash
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/ingress.yaml
```

### 4. CI/CD Pipeline

The **CI/CD pipeline** is automated with **GitHub Actions**. It builds, tests, and pushes Docker images to AWS ECR, then updates the deployments in your AWS EKS cluster.

To trigger the pipeline:
- Push any changes to the `main` branch.
- GitHub Actions will automatically build and deploy the new version of the app.

## Secrets Configuration

In your GitHub repository, configure the following **GitHub Secrets** for the CI/CD pipeline:

- `AWS_ACCESS_KEY_ID`: Your AWS access key.
- `AWS_SECRET_ACCESS_KEY`: Your AWS secret access key.
- `AWS_REGION`: The AWS region where your resources are hosted.
- `ECR_REGISTRY`: Your AWS ECR registry URL.
- `EKS_CLUSTER_NAME`: The name of your EKS cluster.
- `KUBECONFIG_DATA`: Base64-encoded kubeconfig file for accessing the EKS cluster.

## Useful Commands

### Build and Push Docker Images:

```bash
docker build -t <your-ecr-repo-url> ./mini-pastebin-backend
docker push <your-ecr-repo-url>
```

### Kubernetes Deployments:

```bash
kubectl apply -f k8s/backend-deployment.yaml
kubectl apply -f k8s/frontend-deployment.yaml
kubectl apply -f k8s/ingress.yaml
```

### CI/CD Workflow (GitHub Actions)

Check the `.github/workflows/ci-cd-pipeline.yml` for the CI/CD pipeline details.

## Future Enhancements

- Add user authentication for managing snippets.
- Implement search functionality by snippet language or title.
- Set up autoscaling for the EKS cluster based on traffic.
- Add logging and monitoring with AWS CloudWatch or Prometheus.
