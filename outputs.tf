
output "ssh_to_master" {
  value = "ssh ubuntu@${aws_instance.master_node.public_ip}"
} 