output "vpc_peering_connection_id" {
  value = aws_vpc_peering_connection.example.id
}

output "vpc_peering_connection_accepter" {
  value = aws_vpc_peering_connection.example.accepter
}

output "vpc_peering_connection_requester" {
  value = aws_vpc_peering_connection.example.requester
}