variable "aws_region" {
    description = "AWS region"
    type        = string
    default     = "us-east-1"
}

variable "environment" {
    description = "Environment name"
    type        = string
    default     = "dev"
}

variable "project_name" {
    description = "Project name"
    type        = string
}

variable "tags" {
    description = "Common tags for all resources"
    type        = map(string)
    default = {
        Terraform = "true"
    }
}