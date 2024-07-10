provider "aws" {
  region = var.aws_region
  # access_key = var.access_key
  # secret_key = var.secret_key
}

# Call the VPC module
module "vpc" {
  source = "./vpc"
  cidr_block = "10.0.0.0/16"
}

# Call the EKS module
module "eks" {
  source             = "./eks"
  vpc_id             = module.vpc.vpc_id
  public_subnet_ids  = module.vpc.public_subnets
  private_subnet_ids = module.vpc.private_subnets
  eks_role_arn       = module.iam.eks_role_arn    # Pass the EKS role ARN to the EKS module
  node_role_arn      = module.iam.node_role_arn   # Pass the Node IAM role ARN to the EKS module
}

# Call the RDS module
module "rds" {
  source = "./rds"
  vpc_id = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
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