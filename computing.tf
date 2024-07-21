resource "aws_instance" "master_node" {
  ami           = var.myami
  associate_public_ip_address = "true"
  vpc_security_group_ids = [aws_security_group.mysg.id]
  key_name = "mykp"
  subnet_id = aws_subnet.mysubnet.id
  instance_type = "t2.large"
  tags = {
    Name = "master-node"
  }
}