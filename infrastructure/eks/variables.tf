variable "vpc_id" {
  description = "The ID of the VPC"
}

variable "public_subnet_ids" {
  description = "IDs of public subnets"
}

variable "private_subnet_ids" {
  description = "IDs of private subnets"
}

variable "eks_role_arn" {
  description = "The ARN of the IAM role for the EKS cluster"
  type        = string
}

variable "node_role_arn" {
  description = "The ARN of the IAM role for the worker nodes"
  type        = string
}
