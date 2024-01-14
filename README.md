# Jenkins CI/CD Pipeline

## Description

This project implements a CI/CD pipeline for a simple NodeJS application. The pipeline utilizes Jenkins CI/CD server, Docker containers, Docker Hub, AWS EC2, Minikube and Helm.

## Architecture

The CI/CD pipeline integrates:
![alt text](./Design_Overview.png)

- AWS EC2: Hosts dockerized application of the Jenkins server, Jenkins agent and Minikube.
- Jenkins Server: Automate build and deployment processes.
- Minikube: Creates a k8s cluster for NodeJS application.
- Helm: Deploys new deployments to Minikube cluster.
- Docker Hub: Hosts docker images created during the build pipeline

## Prerequisites

- Docker Hub repository
- AWS account with three EC2's
- Install on Jenkins Controller docker
- Install on Jenkins Agent docker and Java
- Minikube, Docker and Helm on Minikube EC2 instance

## Setup and Installation

### AWS - utilized Ubuntu OS

#### Jenkins Controller

1. Resource minimum requirement - 4 GB Ram, 20 GB HD, 2 CPU.
2. Port requirement: 50000 (communication between controller and agent), 8080, 22, 80.
3. SSH key pair
4. Install Docker and Docker compose. Please view this link for docker installation. https://docs.docker.com/engine/install/ubuntu/
5. SCP the docker compose file
6. Docker compose up -d

### Jenkins Agent

1. Resource minimum requirement - Up to the pipeline needs.
2. Security group requirement - 80, 22, 50000
3. SSH key pair
4. Install Java
5. Install docker + add ubuntu to the docker group.

### Minikube

1. Resource minimum requirement - 2 CPU, 2 GB RAM, 20 GB Storage
2. Security group - 22, 80
3. Install Docker
4. Install minikube :
   ```sh
   curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
   sudo install minikube-linux-amd64 /usr/local/bin/minikube
   ```
5. Install helm:
   ```sh
   wget https://get.helm.sh/helm-v3.13.3-linux-amd64.tar.gz
   tar xvf helm-v3.13.3-linux-amd64.tar.gz
   sudo mv linux-amd64/helm /usr/local/bin
   rm helm-v3.13.3-linux-amd64.tar.gz
   rm -rf linux-amd64
   helm version
  ``

### Github setup

1. Fork wanted NodeJs project.
2. Create webhook - settings -> webhook -> Create new webhook.
   Under url provide your Jenkins controller ip + github-webhook. Ex http://your_jenkins_conrtoller_ip:8080/github-webhook/
3. Chose the trigger event to start the pipeline
