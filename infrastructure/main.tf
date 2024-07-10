provider "aws" {
  region = var.aws_region
  # access_key = var.access_key
  # secret_key = var.secret_key
}

# Call the VPC module
module "vpc" {
  source = "./vpc"
  # cidr_block = "10.0.0.0/16"
  networking = var.networking
  security_groups = var.security_groups
}

# Call the EKS module
module "eks" {
  source             = "./eks"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnets_id
  private_subnet_ids = module.vpc.private_subnets_id
  security_groups_id = module.vpc.security_groups_id
  eks_role_arn       = module.iam.eks_role_arn    # Pass the EKS role ARN to the EKS module
  node_role_arn      = module.iam.node_role_arn   # Pass the Node IAM role ARN to the EKS module
  eks_policy         = module.iam.eks_policy
  worker_node_policy = module.iam.worker_node_policy
  ecr_readonly_policy= module.iam.ecr_readonly_policy
  cni_policy         = module.iam.cni_policy
}

# Call the RDS module
module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets_id
}

# Call the ECR module
module "ecr" {
  source = "./ecr"
}

# Call the S3 module
module "s3" {
  source = "./s3"
  bucket_name = "mini-pastebin-assets"
}

# Call the IAM module
module "iam" {
  source = "./iam"
}