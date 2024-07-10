resource "aws_eks_cluster" "main" {
  name     = "mini-pastebin-eks"
  role_arn = var.eks_role_arn   # Use the passed IAM role ARN here

  vpc_config {
    subnet_ids = flatten([var.private_subnet_ids, var.public_subnet_ids])
    security_group_ids = flatten(var.security_groups_id)
  }

  depends_on = [ 
    var.eks_policy
   ]
}

resource "aws_eks_node_group" "node_group" {
  cluster_name    = aws_eks_cluster.main.name
  node_group_name = "mini-pastebin-node-group"
  node_role_arn   = var.node_role_arn   # Use the passed IAM node role ARN here
  subnet_ids      = flatten(var.private_subnet_ids)

  scaling_config {
    desired_size = 3
    max_size     = 4
    min_size     = 2
  }

  ami_type       = "AL2_x86_64"
  instance_types = ["t3.micro"]
  capacity_type  = "ON_DEMAND"
  disk_size      = 20

  depends_on = [
    var.worker_node_policy,
    var.ecr_readonly_policy,
    var.cni_policy
  ]
}
