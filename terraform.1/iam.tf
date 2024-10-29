# # Create IAM Role
# resource "aws_iam_role" "ec2_ecr_role" {
#   name = "EC2ECRRole"

#   assume_role_policy = jsonencode({
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Action = "sts:AssumeRole"
#         Principal = {
#           Service = "ec2.amazonaws.com"
#         }
#         Effect = "Allow"
#         Sid    = ""
#       }
#     ]
#   })
# }

# # Attach ECR access policy to the role
# resource "aws_iam_role_policy_attachment" "ecr_access" {
#   policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
#   role       = aws_iam_role.ec2_ecr_role.name
# }

# # Create an IAM Instance Profile for the EC2 role
# resource "aws_iam_instance_profile" "ec2_ecr_instance_profile" {
#   name = "EC2ECRInstanceProfile"
#   role = aws_iam_role.ec2_ecr_role.name
# }
