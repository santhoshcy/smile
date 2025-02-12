# Smile Website - DevOps Workflow

This repository demonstrates a complete DevOps workflow for deploying a simple website using various tools like Terraform, Ansible, Jenkins, Docker, Kubernetes, and Argo CD.

## Workflow Overview

1. **Website Code (Local Development)**

   - Files: `index.html`, `style.css`, `script.js`
   - Command to preview locally (Optional):
     ```bash
     xdg-open index.html
     ```

2. **Terraform (Infrastructure Setup)**

   - Files: `main.tf`
   - Commands:
     ```bash
     terraform init
     terraform apply -auto-approve
     ```

3. **Ansible (Configuration Management)**

   - Files: `install.yml`, `hosts.ini`
   - Commands:
     ```bash
     ansible-playbook -i hosts.ini install.yml
     ```

4. **Jenkins (CI/CD Pipeline)**

   - Files: `Jenkinsfile`
   - Access Jenkins:
     ```bash
     http://<EC2_PUBLIC_IP>:8080
     ```
   - Set up a pipeline job in Jenkins and point it to this repository.

5. **Docker (Image Build & Run)**

   - Files: `Dockerfile`
   - Commands:
     ```bash
     docker build -t smile-website .
     docker run -d -p 80:80 smile-website
     ```

6. **Kubernetes (Minikube Deploy)**

   - Files: `smile-deployment.yaml`, `smile-service.yaml`
   - Commands:
     ```bash
     minikube start
     kubectl apply -f smile-deployment.yaml
     kubectl apply -f smile-service.yaml
     minikube service smile-service
     ```

7. **Argo CD (GitOps Automation)**

   - Commands to install and access Argo CD:
     ```bash
     kubectl create namespace argocd
     kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

     kubectl port-forward svc/argocd-server -n argocd 8080:443
     xdg-open http://localhost:8080

     kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 --decode
     ```
   - Default Login:
     - Username: `admin`
     - Password: (output from the last command)

## Repository Structure

```
.
|-- index.html
|-- style.css
|-- script.js
|-- Dockerfile
|-- main.tf
|-- install.yml
|-- hosts.ini
|-- Jenkinsfile
|-- smile-deployment.yaml
|-- smile-service.yaml
```

## Summary Flow

```
Website Code → Terraform (Infra) → Ansible (Config) → Jenkins (CI/CD) → Docker (Image/Container) → Kubernetes (Pods/Deployments) → Argo CD (GitOps Automation)
```

