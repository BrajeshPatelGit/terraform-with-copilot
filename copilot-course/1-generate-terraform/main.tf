terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.64.0"
    }
  }
}

resource "aws_vpc" "prd-vpc" {
  cidr_block = "10.0.0.0/16"
}

# AWS Public Subnet for Production VPC
# Creates a public subnet in the production VPC with a /24 CIDR block
# Located in us-east-1a availability zone
# Used for resources that need direct internet access through an Internet Gateway
resource "aws_subnet" "prd-pub-subnet-1" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prd-pub-subnet-1"
  }
}

#question: What is the purpose of the aws_subnet resource in this Terraform configuration?
#answer: The aws_subnet resource in this Terraform configuration is used to create a subnet within the specified VPC (Virtual Private Cloud). In this case, it creates a public subnet with a CIDR block of

resource "aws_subnet" "prd-pub-subnet-2" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prd-pub-subnet-2"
  }
}

resource "aws_subnet" "prd-pub-subnet-3" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "prd-pub-subnet-3"
  }
}

resource "aws_subnet" "prd-pri-subnet-1" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.10.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "prd-pri-subnet-1"
  }
}

resource "aws_subnet" "prd-pri-subnet-2" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.11.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "prd-pri-subnet-2"
  }
}

resource "aws_subnet" "prd-pri-subnet-3" {
  vpc_id            = aws_vpc.prd-vpc.id
  cidr_block        = "10.0.12.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "prd-pri-subnet-3"
  }
}

resource "aws_internet_gateway" "prd-igw" {
  vpc_id = aws_vpc.prd-vpc.id

  tags = {
    Name = "prd-igw"
  }
}

resource "aws_route_table" "prd-pub-rt" {
  vpc_id = aws_vpc.prd-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.prd-igw.id
  }
}

resource "aws_route_table_association" "prd-pub-rt-assoc-1" {
  subnet_id      = aws_subnet.prd-pub-subnet-1.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

resource "aws_route_table_association" "prd-pub-rt-assoc-2" {
  subnet_id      = aws_subnet.prd-pub-subnet-2.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

resource "aws_route_table_association" "prd-pub-rt-assoc-3" {
  subnet_id      = aws_subnet.prd-pub-subnet-3.id
  route_table_id = aws_route_table.prd-pub-rt.id
}

resource "aws_route_table" "prd-pri-rt" {
  vpc_id = aws_vpc.prd-vpc.id
}

resource "aws_route_table_association" "prd-pri-rt-assoc-1" {
  subnet_id      = aws_subnet.prd-pri-subnet-1.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

resource "aws_route_table_association" "prd-pri-rt-assoc-2" {
  subnet_id      = aws_subnet.prd-pri-subnet-2.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

resource "aws_route_table_association" "prd-pri-rt-assoc-3" {
  subnet_id      = aws_subnet.prd-pri-subnet-3.id
  route_table_id = aws_route_table.prd-pri-rt.id
}

resource "aws_security_group" "prd-sg" {
  name        = "prd-sg"
  description = "Security group for production workloads"
  vpc_id      = aws_vpc.prd-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow SSH access"
  }

  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
      description = "Allow all outbound traffic"
    }
  ]
}

resource "aws_eks_cluster" "AWS_eks_cluster" {
  name     = "prd-cluster"
  role_arn = "arn:aws:iam::123456789012:role/eks-role"
  vpc_config {
    security_group_ids = [aws_security_group.prd-sg.id]
    subnet_ids         = [
      aws_subnet.prd-pub-subnet-1.id,
      aws_subnet.prd-pub-subnet-2.id,
      aws_subnet.prd-pub-subnet-3.id,
      aws_subnet.prd-pri-subnet-1.id,
      aws_subnet.prd-pri-subnet-2.id,
      aws_subnet.prd-pri-subnet-3.id
    ]
  }
  
}

resource "aws_load_balancer_backend_server_policy" "LoadBalancerBackendServerPolicy" {
  load_balancer_name = "prd-lb"
  instance_port      = 80
  policy_names       = ["prd-backend-policy"]
  
}

resource "aws_load_balancer_policy" "prd-backend-policy" {
  load_balancer_name = "prd-lb"
  policy_name        = "prd-lb-policy"
  policy_type_name   = "ProxyProtocolPolicyType"
  
}

resource "aws_" "name" {
  
}