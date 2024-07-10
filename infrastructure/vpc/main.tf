resource "aws_vpc" "main" {
  cidr_block = var.cidr_block
}

# Get the available availability zones
data "aws_availability_zones" "available" {}

# Create Public Subnets across multiple Availability Zones
resource "aws_subnet" "public" {
  count                   = 2  # Create 2 subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Public Subnet - ${data.aws_availability_zones.available.names[count.index]}"
  }
}

# Create Private Subnets across multiple Availability Zones
resource "aws_subnet" "private" {
  count                   = 2  # Create 2 subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = cidrsubnet(var.cidr_block, 4, count.index + 2)
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  tags = {
    Name = "Private Subnet - ${data.aws_availability_zones.available.names[count.index]}"
  }
}


# Internet Gateway for Public Subnets
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
}

# Route Table for Public Subnets
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }
}
