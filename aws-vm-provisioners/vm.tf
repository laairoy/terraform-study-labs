resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "vm" {
  ami                         = "ami-024e6efaf93d85776"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_ids      = [data.terraform_remote_state.vpc.outputs.security_group_id]
  associate_public_ip_address = true

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("./aws-key")
    host        = self.public_ip
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} >> public_ip.txt"
  }

  provisioner "file" {
    content     = "public ip used: ${self.public_ip}"
    destination = "/tmp/public_ip.txt"
  }

  provisioner "remote-exec" {
    inline = [
      "echo ${self.ami} >> /tmp/ami.txt",
      "echo private ip: ${self.private_ip} >> /tmp/private_ip.txt"
    ]
  }

  tags = {
    "Name" : "vm-terraform"
  }

}
