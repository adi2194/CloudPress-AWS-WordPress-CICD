# 🚀 Scalable WordPress Deployment on AWS with Terraform, Ansible, and Jenkins

A fully automated, full-stack WordPress deployment pipeline built for AWS using Terraform, Ansible, and Jenkins. This system provisions scalable infrastructure, configures WordPress, and orchestrates the entire workflow via a customizable Jenkins pipeline.

> 💡 This project is under active development and updated frequently with improvements, fixes, and new features.

> 📘 A comprehensive guide covering setup, configuration, and best practices for fully replicating this project is coming soon.


---

## 🛠️ Key Features

- Modular Infrastructure-as-Code with Terraform
  - VPC, EC2, RDS provisioning
  - Environment and resource parameterization
    
- Configuration Management with Ansible
  - Apache, PHP, MySQL client installation
  - Automated WordPress deployment and configuration
    
- CI/CD Pipeline with Jenkins
  - Fully parameterized pipeline execution
  - Dynamic provisioning based on user-defined inputs
    
- Scalable and secure AWS architecture
- Clean, modular, and reusable codebase

---

## 📦 Tech Stack

| Layer         | Technology                     |
|--------------|---------------------------------|
| CI/CD        | Jenkins                         |
| Provisioning | Terraform                       |
| Config Mgmt   | Ansible                         |
| Cloud        | AWS (VPC, EC2, RDS)             |
| App Stack    | Apache, PHP, WordPress          |
| Database     | Amazon RDS (MySQL)              |

---


## 🔐 Security

Sensitive configurations like AWS credentials and database passwords are handled via environment variables and Jenkins credentials. No secrets are stored in the repository.

---

