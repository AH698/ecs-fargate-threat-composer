# Threat Composer on AWS ECS Fargate 

## Description

A production-style deployment of AWS Threat Composer, a threat modelling tool, running as a
container on Amazon ECS Fargate behind an Application Load Balancer and served over HTTPS 
on a custom domain.

The infrastructure is built with modular Terraform and managed through three GitHub Actions
pipelines: one to build and publish the container image, one to plan and apply 
infrastructure changes, and one to tear everything down on demand. The build and deploy 
pipelines includes security scanning. Authentication is processed via OIDC, which issues 
short-lived credentials for each run, so no long-lived access keys are ever stored 
in GitHub.

## Architecture diagram
![Architecture diagram](images/architecture-diagram.png)

## Repository structure 
```text
.
├── .github
│   └── workflows
│       ├── destroy.yml
│       ├── image.yml
│       └── infra.yml
├── app/
├── images/
├── infra
│   ├── modules
│   │   ├── acm/
│   │   ├── alb/
│   │   ├── ecr/
│   │   ├── ecs/
│   │   ├── route53/
│   │   └── vpc/
│   ├── .terraform.lock.hcl
│   ├── main.tf
│   ├── provider.tf
│   ├── terraform.tfvars
│   └── variables.tf
├── .dockerignore
├── .gitignore
├── .trivyignore
├── Dockerfile
└── README.md
```

## Local Setup

### Prerequisites

To deploy this project yourself, you'll need:

- An AWS account with MFA switched on for your IAM user
- AWS CLI, configured with credentials for that account
- Docker, to build and test the container image locally
- Terraform (version 1.16 or later), to provision the infrastructure
- A registered domain with a Route 53 hosted zone, which the app will be served from
- An S3 bucket to hold the Terraform remote state
- A GitHub OIDC setup in AWS: an identity provider for GitHub Actions and an IAM role whose trust policy only allows this repository

### Get the code

Clone this repository to your local machine:

```bash
git clone https://github.com/AH698/ecs-fargate-threat-composer.git
cd ecs-fargate-threat-composer
```

### Run the app locally

You can run the app on your own machine with Docker, without touching AWS.

1. Build the Docker image from the Dockerfile in the root of the repository:

```bash
   docker build -t threat-composer .
```

2. Start a container from the image:

```bash
   docker run --rm -p 8080:8080 threat-composer
```

3. Open http://localhost:8080 in your browser.

The container listens on port 8080 because it uses the non-root nginx image, and `-p 8080:8080` maps that port to your machine. Press Ctrl+C in the terminal to stop it.

### Deploy to AWS

1. In your GitHub repository settings, add the secrets `AWS_REGION`, `AWS_ROLE_ARN` and `AWS_ECR`, and create an environment called `production` with yourself as a required reviewer.
2. Update the trust policy of your IAM role so it matches your repository, including the `production` environment.
3. Update `infra/terraform.tfvars` with your domain, region and image tag.
4. Run the image workflow to build, scan and push the container image to ECR.
5. Push a change inside `infra/`, or run the infrastructure workflow manually. Review the plan, then approve the apply in Review deployments.
6. When you've finished, run the destroy workflow to tear everything down.