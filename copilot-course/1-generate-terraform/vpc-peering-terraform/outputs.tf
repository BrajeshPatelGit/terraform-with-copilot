resource "aws_vpc_peering_connection" "example" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  auto_accept   = var.auto_accept

  tags = {
    Name = var.name
  }
}

output "peering_connection_id" {
  value = aws_vpc_peering_connection.example.id
}

output "peering_connection_status" {
  value = aws_vpc_peering_connection.example.status
}