resource "aws_instance" "my_Amazon_linux" {
launch_template {
  id = aws_launch_template.EX1_polybot_temp.id
  version = "$Default"
}

  tags = {
    project = "terraform remote state"
  }
}
