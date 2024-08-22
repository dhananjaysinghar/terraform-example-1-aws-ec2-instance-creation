resource "aws_security_group" "allow_tls_anywhere" {
  name        = "allow_tls_anywhere"
  description = "Allow TLS inbound traffic and all outbound traffic"

  dynamic "ingress" {
    for_each = var.AWS_ALLOWED_PORTS
    iterator = port
    content {
      description = "TLS from VPC for 22 port"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

}

resource "aws_key_pair" "my-pub_key" {
  key_name   = "my-pub_key"
  public_key = file("${path.module}/id_rsa.pub")
}


resource "aws_instance" "My-Linux-Amazon-Machine" {
  ami           = "ami-02b49a24cfb95941c"
  instance_type = "t2.micro"
  tags = {
    Name = "My-Linux-Amazon-Machine"
  }
  key_name               = aws_key_pair.my-pub_key.key_name
  vpc_security_group_ids = [aws_security_group.allow_tls_anywhere.id]
}