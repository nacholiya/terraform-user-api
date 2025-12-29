resource "aws_dynamodb_table" "user_data" {
  name         = "UserData"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }

  tags = {
    Name = "UserData"
  }
}
