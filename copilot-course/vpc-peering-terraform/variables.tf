variable "vpc_id_a" {
  description = "The ID of the first VPC."
  type        = string
}

variable "vpc_id_b" {
  description = "The ID of the second VPC."
  type        = string
}

variable "region" {
  description = "The AWS region where the VPCs are located."
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "A map of tags to assign to the VPC peering connection."
  type        = map(string)
  default     = {}
}