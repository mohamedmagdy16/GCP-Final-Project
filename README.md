## Task 

1 VPC
2 subnets (management subnet & restricted subnet):
1. Management subnet has the following:
• NAT gateway
• Private VM

2. Restricted subnet has the following:
• Private standard GKE cluster (private control plan)
Notes:

1. Restricted subnet must not have access to internet
2. All images deployed on GKE must come from GCR or Artifacts registry.
3. The VM must be private.
4. Deployment must be exposed to public internet with a public HTTP load balancer.
5. All infra is to be created on GCP using terraform.
6. Deployment on GKE can be done by terraform or manually by kubectl tool.
7. The code to be build/dockerized and pushed to GCR is on here:
https://github.com/atefhares/DevOps-Challenge-Demo-Code
8. Don’t use default compute service account while creating the gke cluster, create
custom SA and attach it to your nodes.
9. Only the management subnet can connect to the gke cluster.

## Containerize the web application [link](https://github.com/atefhares/DevOps-Challenge-Demo-Code)
- Create Dockerfile for the web application



# Provision infrastructure on GCP
1. Create a GCP project
2. Create GS bucket and enable versioning to store the terraform state file
3. Clone repo 
4. edit project_id in infrastructure.tfvars with your project id and edit provider configuration 


# provision the infrastructure on GCP
```bash
# initialize terraform
terraform init

# check plan
terraform plan infrastructure.tfvars

# applying the plan 
terraform apply infrastructure.tfvars
