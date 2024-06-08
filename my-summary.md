# Coworking Space Service

## Overview

The Coworking Service is a set of APIs that enable users to request one-time tokens and administrators to authorize access to a coworking space. The service is built using a microservice architecture.

## Key Components

### 1. Application Code
- **Language**: Python 3.11.8
- **Dependencies**: Managed via `requirements.txt`
- **Entry Point**: `app.py`

### 2. Docker
- **Dockerfile**: Located at the root of the project
- **Image**: Built using Python base image

### 3. Kubernetes
- **Cluster Management**: AWS EKS
- **Deployment**: Managed using Kubernetes manifests
- **Helm**: Used for managing PostgreSQL deployment

### 4. AWS Services
- **ECR (Elastic Container Registry)**: Stores Docker images
- **CodeBuild**: Automates the build process

## Workflow

### 1. Setting Up the Environment
Ensure you have the following tools installed and configured:
- AWS CLI
- Docker
- kubectl
- helm

### 2. Building the Docker Image
The Docker image for the application is built using a `Dockerfile` located in the root directory.

### 3. Deploying to Kubernetes

#### Set Up PostgreSQL
```bash
helm repo add bitnami https://charts.bitnami.com/bitnami
helm install coworking-db bitnami/postgresql
```

#### Deploy the Application
Create a Kubernetes deployment manifest following template in deployment folder

Apply the deployment:
```bash
kubectl apply -f path/to/your/deployment.yaml
```

### 4. Releasing New Builds
To release new builds:
1. Update the codebase.
2. Push changes to the repository.
3. AWS CodeBuild triggers a new build, creates a Docker image, and pushes it to ECR.
4. Update the image tag in the Kubernetes deployment manifest and apply the changes:

