resource "aws_instance" "this" {
  ami           = "ami-0d7a109bf30624c99"
  instance_type = "t2.micro"
  key_name      = "terraform"

  tags = {
    Name = local.web_server
  }
  vpc_security_group_ids = [aws_security_group.this.id]
}

resource "aws_security_group" "this" {
  name        = "allow_tlc"
  description = "allow tlc inbound traffic"
  vpc_id      = aws_vpc.this.id

  dynamic "ingress" {
    for_each = var.inbound_rules_web
    content {
      description = ingress.value.description
      protocol    = ingress.value.protocol
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      cidr_blocks = [aws_vpc.this.cidr_block]
    }

  }

  egress {
    from_port = 0
    to_port   = 0
    protocol  = -1

  }

  tags = {
    name = "allow_web_server"
  }
}
