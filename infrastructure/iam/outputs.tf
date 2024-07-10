output "eks_role_arn" {
  value = aws_iam_role.eks_role.arn
}

output "node_role_arn" {
  value = aws_iam_role.node_role.arn
}

output "worker_node_policy" {
  value = aws_iam_role_policy_attachment.worker_node_policy
}

output "ecr_readonly_policy" {
  value = aws_iam_role_policy_attachment.ecr_readonly_policy
}

output "cni_policy" {
  value = aws_iam_role_policy_attachment.cni_policy
}

output "eks_policy" {
  value = aws_iam_role_policy_attachment.eks_policy
}