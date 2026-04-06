resource "aws_instance" "backend" {

  for_each = aws_subnet.backend

  ami           = data.aws_ami.backend.id
  instance_type = var.backend_instance_type
  key_name      = data.aws_key_pair.main.key_name
  #iam_instance_profile = aws_iam_instance_profile.backend_profile.id
  user_data = <<-EOF
    #!/bin/bash
    cd /var/www/myblazorapp
    sudo -u myblazorapp-svc dotnet FleetAPI.dll
  EOF
  #filebase64("${path.module}/files/backend.sh") #data.cloudinit_config.backend.rendered
  #monitoring = true

  network_interface {
    network_interface_id = aws_network_interface.backend[each.key].id
    device_index         = 0
  }

  tags = {
    Name        = "${var.application_name}-${var.environment_name}-backend-vm"
    application = var.application_name
    environment = var.environment_name
  }
}

resource "aws_network_interface" "backend" {

  for_each = aws_subnet.backend

  subnet_id = each.value.id
}

resource "aws_network_interface_sg_attachment" "backend" {

  for_each = aws_instance.backend

  security_group_id    = aws_security_group.backend.id
  network_interface_id = each.value.primary_network_interface_id

}
