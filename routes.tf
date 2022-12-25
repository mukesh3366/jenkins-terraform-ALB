resource "aws_route_table" "pub_route" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0" 
    gateway_id = aws_internet_gateway.gw.id 
  }

  tags = {
    Name = "jenkins_public_route"
  }
}

resource "aws_route_table" "pri_route" {
  vpc_id = aws_vpc.main.id
 
  route {
    cidr_block = var.subnet_cidr[1] 
    gateway_id = aws_nat_gateway.nat.id 
  } 

  tags = {
    Name = "jenkins_private_route"
  }
}
 