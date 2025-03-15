## Backend Component Documentation

This repository contains the backend component for the multicloud platform. The backend is responsible for handling deployment requests, managing DNS, and interacting with cloud providers. It is built using Python and deployed using Docker and Kubernetes.

## Table of Contents

1. [Project Structure](#project-structure)
2. [Prerequisites](#prerequisites)
3. [Getting Started](#getting-started)
4. [Building the Docker Image](#building-the-docker-image)
5. [Deploying to Kubernetes](#deploying-to-kubernetes)
6. [Configuration](#configuration)


## Project Structure

Root Directory
.<br>
├── src/                        # Source code for the backend application<br>
├── backend-configMap.yaml      # Kubernetes ConfigMap for backend configuration<br>
├── backend-deployment.yaml     # Kubernetes Deployment for the backend<br>
├── backend-service.yaml        # Kubernetes Service for exposing the backend<br>
├── Dockerfile                  # Dockerfile for building the backend image<br>
├── LICENSE                     # License file for the project<br>
├── README.md                   # Project documentation<br>
└── requirements.txt            # Python dependencies<br>
<br>

src/ Directory
src/
├── archive/                    # Archived files <br>
├── auth.py                     # Authentication and authorization logic<br>
├── config.py                   # Configuration settings for the backend<br>
├── deployment.py               # Deployment logic for cloud providers<br>
├── dns_manager.py              # DNS management logic<br>
├── main_app.py                 # Main application entry point<br>
├── models.py                   # Database models (if applicable)<br>
└── Notes.txt                   # Some notes <br>


## Prerequisites

Before you begin, ensure you have the following installed:

- [Python](https://www.python.org/) (v3.8 or higher)
- [Docker](https://www.docker.com/) (v20 or higher)
- [Kubernetes](https://kubernetes.io/) (optional, for deployment)
- [kubectl](https://kubernetes.io/docs/tasks/tools/) (optional, for Kubernetes deployment)

## Getting Started

1. Clone the repository:

    git clone https://github.com/dbd311/backend-multicloud.git
    cd backend-multicloud

2. Install Python dependencies:

    pip install -r requirements.txt

3. Build and Run the backend application locally:
    docker build -t backend-multicloud:latest .
    docker run -p 5000:5000 backend-multicloud:latest

    -p 5000:5000: Maps port 5000 on your local machine to port 5000 in the container.
    backend-multicloud:latest: The name and tag of the Docker image to run.

4. Access the Application:

    Once the container is running, open your browser and navigate to:

        http://localhost:5000
        
    The application should now be accessible from your local machine.

## Deploying to Kubernetes

The Kubernetes manifests provided in this repository can be used to deploy the backend application to a Kubernetes cluster.

1. Apply the Kubernetes manifests:

    kubectl apply -f backend-configMap.yaml
    kubectl apply -f backend-deployment.yaml
    kubectl apply -f backend-service.yaml 

2. Verify the deployment:

    kubectl get pods
    kubectl get services

3. Access the backend through the Service endpoint.



## Configuration

Kubernetes Manifests

    backend-configMap.yaml: Contains environment-specific configuration for the backend.

    backend-deployment.yaml: Defines the Kubernetes Deployment for the backend application.

    backend-service.yaml: Exposes the backend application as a Kubernetes Service.