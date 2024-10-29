variable "linux_ami_id" {
  description = "AMI ID for EC2 instances"
  type        = string
  default     = "ami-06b21ccaeff8cd686" # Amazon Linux 2 AMI (Change as needed)
}
variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.medium"
}
variable "public_subnet" {
  description = "Default public subnet"
  type = string
  default = "value"
}