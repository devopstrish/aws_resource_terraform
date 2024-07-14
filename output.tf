output "instance-IP-public"{
   value=aws_instance.demo[*].public_ip
}

output "instance-IP-private"{
   value=aws_instance.demo[*].private_ip
}
output "instance-AZ"{
   value=aws_instance.demo[*].availability_zone    
}

output "instance-network-interface"{
   value=aws_instance.demo[*].primary_network_interface_id     
}
output "vpc-default_route_table_id"{
    value = aws_vpc.myvpc.default_route_table_id
}