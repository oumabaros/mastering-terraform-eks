resource "aws_iam_user" "admin" {
  for_each = toset(var.admin_users)
  name     = each.key
}

resource "aws_iam_user" "ecr_image_pushers" {
  for_each = toset(var.ecr_image_pushers)
  name     = each.key
}
