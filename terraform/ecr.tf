resource "aws_ecr_repository" "ecr_for_assignment1" {
  name = "ecr_for_assignment1"
  image_tag_mutability = "MUTABLE"
}

data "aws_iam_policy_document" "example" {
  statement {
    sid    = "new policy"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = ["251298034216"]
    }

    actions = [
      "ecr:*",
    ]
  }
}

resource "aws_ecr_repository_policy" "example" {
  repository = aws_ecr_repository.ecr_for_assignment1.name
  policy     = data.aws_iam_policy_document.example.json
}

# resource "aws_ecr_repository" "ecr_for_assignment1" {
#   name                 = "ecr_for_assignment1"
#   image_tag_mutability = "MUTABLE"

#   image_scanning_configuration {
#     scan_on_push = true
#   }
# }

# data "aws_iam_policy_document" "example" {
#   statement {
#     sid    = "new policy"
#     effect = "Allow"

#     principals {
#       type        = "AWS"
#       identifiers = ["123456789012"]
#     }

#     actions = [
#       "ecr:*",
#     ]
#   }
# }

# resource "aws_ecr_repository_policy" "example" {
#   repository = aws_ecr_repository.ecr_for_assignment1.name
#   policy     = data.aws_iam_policy_document.example.json
# }