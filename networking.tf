resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      "Name" = "myvpc"
    }
}

resource "aws_internet_gateway" "myigw" {
  vpc_id = aws_vpc.webappvpc.id
  tags = {
    Name = "myig"
  }
}
 
resource "aws_subnet" "mysubnet" {
  vpc_id     = aws_vpc.webappvpc.id
  cidr_block = "10.0.0.0/24"

  tags = {
    Name = "mysubnet"
  }
}

resource "aws_route_table" "myrtb" {
vpc_id = "${aws_vpc.webappvpc.id}"
 route {
 cidr_block = "0.0.0.0/0"
 gateway_id = "${aws_internet_gateway.myigw.id}"
 }
 tags = {
 Name = "myrtb"
 }
}

resource "aws_route_table_association" "myrtba" {
 subnet_id = aws_subnet.mysubnet.id
 route_table_id = aws_route_table.myrtb.id
}