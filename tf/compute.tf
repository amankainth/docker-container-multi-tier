# Generate private key
resource "tls_private_key" "swarm_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

# Create AWS Key Pair
resource "aws_key_pair" "generated_key" {
  key_name   = "swarm-manager-key"
  public_key = tls_private_key.swarm_key.public_key_openssh
}

# Save the private key locally as a .pem file
resource "local_file" "private_key_pem" {
  content  = tls_private_key.swarm_key.private_key_pem
  filename = "${path.module}/swarm-manager-key.pem"
}

data "aws_ami" "amazon_linux_2023" {
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["137112412989"]
}

resource "aws_instance" "swarm_manager" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.swarm_sg.id]
  key_name               = aws_key_pair.generated_key.key_name

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }
  tags = {
    Name = "swarm-manager-node"
  }
}

# 6. Create the Worker Nodes
resource "aws_instance" "swarm_workers" {
  count                  = 2
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.medium"
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.swarm_sg.id]
  key_name               = aws_key_pair.generated_key.key_name

  tags = {
    Name = "swarm-worker-node-${count.index + 1}"
  }
}

output "worker_ips" {
  value = aws_instance.swarm_workers[*].public_ip
}


output "public_ip" {
  value = aws_instance.swarm_manager.public_ip
}
