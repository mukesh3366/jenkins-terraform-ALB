resource "aws_vpc" "main" {
  cidr_block       = var.cidr_block
  instance_tenancy = "default"

  tags = {
    Name = "Jenkins-docker-app"
  }
} 

resource "aws_instance" "web" {
  ami           = "ami-0f9d9a251c1a44858"
  instance_type = "t3.micro"
  subnet_id = aws_subnet.pri_subnet.id 
  tags = {
    Name = "Jenkins-docker-EC2" 
  }
} 

resource "aws_subnet" "pub_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr[0] 

  tags = {
    Name = "jenkins_public_subnet"
  }
}

resource "aws_subnet" "pri_subnet" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr[1] 

  tags = {
    Name = "jenkins_private_subnet" 
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "Jenkins_igw"
  }
} 

resource "aws_eip" "lb" {
  #instance = aws_instance.web.id
  vpc      = true
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.lb.id
  subnet_id     = aws_subnet.pri_subnet.id 

  tags = {
    Name = "gw NAT"
  }
}  