# Creating InternetGateway
resource "aws_internet_gateway" "nodeapp_igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name        = "${var.application_name}-${var.environment_name}-nodeapp-igw"
    application = var.application_name
    environment = var.environment_name
  }
}
