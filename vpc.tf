resource "aws_vpc" "this" {
  cidr_block = var.cidr_block

  tags = merge(
    var.tags,
    {
      Name = "k8s-vpc"
    },
  )
}

resource "aws_subnet" "this_private" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr_block_private
  availability_zone       = var.az_region_private
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = "k8s-subnet-private"
    },
  )
}

resource "aws_subnet" "this_public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.subnet_cidr_block_public
  availability_zone       = var.az_region_public
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name = "k8s-subnet-public"
    },
  )
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
    {
      Name = "k8s-igw"
    },
  )
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id
  route {
    cidr_block = var.rtb_cidr
    gateway_id = aws_internet_gateway.this.id
  }
  tags = merge(
    var.tags,
    {
      Name = "k8s-rtb"
    },
  )
}

resource "aws_route_table_association" "this" {
  subnet_id      = aws_subnet.this_public.id
  route_table_id = aws_route_table.this.id
}


resource "aws_route" "this" {
  route_table_id         = aws_vpc.this.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.this.id
}
