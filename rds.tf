resource "aws_db_instance" "default" {
  allocated_storage    = 10
  db_name              = "expense"
  engine               = var.engine
  engine_version       = var.engine_version
  instance_class       = var.instance_class
  password             = jsondecode("data.vault_generic_secret.rds.data_json").password
  username             = jsondecode("data.vault_generic_secret.rds.data_json").username
  parameter_group_name = "default.mysql8.0"
}

data "vault_generic_secret" "rds" {
  path = "expense-dev/rds"
}

resource "local_file" "test" {
  content  = data.vault_generic_secret.rds.data_json
  filename = "/tmp/temp.json"
}