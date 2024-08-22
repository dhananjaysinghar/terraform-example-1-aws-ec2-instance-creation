output "connect" {
  value = "ssh -i id_rsa ec2-user@${aws_instance.My-Linux-Amazon-Machine.public_ip}"
}