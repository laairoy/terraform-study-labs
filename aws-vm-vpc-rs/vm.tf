resource "aws_key_pair" "key" {
  key_name   = "aws-key"
  public_key = file("./aws-key.pub")
}

resource "aws_instance" "web" {
  ami                   = "ami-024e6efaf93d85776"
  instance_type         = "t2.micro"
  key_name              = aws_key_pair.key
  subnet_id             = data.terraform_remote_state.vpc.outputs.subnet_id
  vpc_security_group_id = [data_terraform_remote_state.outputs.security_group_id]

  tags = {
    "Name" : "vm-terraform"
  }
}
