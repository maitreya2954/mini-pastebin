# Create an AWS ECR repository to store Docker images
resource "aws_ecr_repository" "app" {
  name = var.repository_name
  image_tag_mutability = "MUTABLE"  # Allows updating images with the same tag
  image_scanning_configuration {
    scan_on_push = true  # Enables automatic scanning of images
  }

  tags = {
    Name = "mini-pastebin-ecr"
  }
}
