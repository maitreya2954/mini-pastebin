variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "public_subnet_ids" {
  description = "IDs of public subnets"
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
}

variable "security_groups_id" {
  description = "IDs of secuirty groups"
}

variable "eks_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the worker nodes"
  type        = string
}

variable "eks_policy" {
  description = "IAM policy for EKS cluster"
}

variable "worker_node_policy" {
  description = "IAM policy for worker node"
}

variable "ecr_readonly_policy" {
  description = "IAM policy for ECR ReadOnly"
}

variable "cni_policy" {
  description = "CNI policy"
}
