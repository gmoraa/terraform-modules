resource "aws_instance" "ec2_server" {
  ami                   = var.ami
  instance_type         = var.type
  key_name              = var.ssh_key

  root_block_device {
    volume_size         = var.root_size
  }
  tags = {
    Name                = var.server_name
  }
}