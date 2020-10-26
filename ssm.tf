# aws ssm put-parameter --region=us-east-1 --name 'marvel-private-key' --type "SecureString" --value 'key'
data "aws_ssm_parameter" "marvel_private_key" {
  name = "marvel-private-key"
}

# aws ssm put-parameter --region=us-east-1 --name 'marvel-public-key' --type "SecureString" --value 'key'
data "aws_ssm_parameter" "marvel_public_key" {
  name = "marvel-public-key"
}