# 🚀 Terraform Serverless User API on AWS

An end-to-end serverless REST API built on AWS using Terraform (Infrastructure as Code).
This project provisions and deploys a backend system using API Gateway, AWS Lambda, and DynamoDB.

---

## 📌 Project Overview

This API accepts user data (name and age) via an HTTP POST request and stores it in a DynamoDB table.

Key highlights:
- 100% Infrastructure as Code (Terraform)
- Serverless and scalable
- No hardcoded credentials
- Industry-style AWS architecture

---

## 🧱 Architecture Diagram

Client (Postman)
        |
        | POST /user
        v
API Gateway (REST)
        |
        v
AWS Lambda (Python)
        |
        v
DynamoDB (UserData Table)

---

## 🔄 Workflow (Step by Step)

1. Client sends POST request with JSON body (name, age)
2. API Gateway receives the request
3. API Gateway triggers Lambda using proxy integration
4. Lambda:
   - Parses request body
   - Generates a UUID
   - Stores data in DynamoDB
5. Lambda returns success response

---

## 🛠️ Tech Stack

- Terraform
- AWS Lambda (Python 3.12)
- Amazon API Gateway (REST)
- Amazon DynamoDB
- AWS IAM
- Git & GitHub
- Postman

---

## 📁 Project Structure

terraform-user-api/
├── provider.tf
├── dynamodb.tf
├── iam.tf
├── lambda.tf
├── apigateway.tf
├── lambda_function.py
├── .gitignore
└── README.md

---

## ⚙️ Prerequisites

Check installations:

terraform version
aws --version
git --version

---

## 🔐 AWS Configuration

aws configure

Provide:
- AWS Access Key
- AWS Secret Key
- Region: us-east-1

---

## 🚀 Deployment Using Terraform

Initialize Terraform:
terraform init

Review plan:
terraform plan

Apply infrastructure:
terraform apply

Type: yes

Resources created:
- DynamoDB table
- IAM role and policies
- Lambda function
- API Gateway
- API deployment (dev stage)

---

## 🌐 API Endpoint

POST /user

Invoke URL:
https://<api-id>.execute-api.us-east-1.amazonaws.com/dev/user

---

## 🧪 Testing with Postman

Method: POST

Headers:
Content-Type: application/json

Body:
{
  "name": "Nikhil",
  "age": 25
}

---

## ✅ Expected Response

{
  "message": "Data saved successfully",
  "data": {
    "id": "uuid",
    "name": "Nikhil",
    "age": 25
  }
}

---

## 🗄️ DynamoDB Verification

AWS Console → DynamoDB → UserData → Explore items

---

## 🧹 Cleanup (Destroy Infrastructure)

terraform destroy

Type: yes

---

## 🔒 Security Best Practices

- No secrets committed to GitHub
- Terraform state excluded via .gitignore
- IAM role scoped for Lambda

---

## 📚 Learning Outcomes

- Terraform Infrastructure as Code
- AWS Serverless architecture
- REST API design
- IAM permissions
- End-to-end DevOps workflow

---

## 👤 Author

Nikhil Acholiya  
DevOps / Cloud Engineer

---

## ⭐ Notes

This project is resume-ready and interview-ready.

