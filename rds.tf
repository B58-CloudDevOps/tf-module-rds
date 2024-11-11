# resource "aws_db_instance" "default" {
#   allocated_storage           = 10
#   db_name                     = "mydb"
#   engine                      = "mysql"
#   engine_version              = "8.0"
#   instance_class              = "db.t3.micro"
#   manage_master_user_password = 
#   username                    = 
#   parameter_group_name        = "default.mysql8.0"
# }

data "vault_generic_secret" "rds" {
  path = "expense-dev/rds"
}

resource "local_file" "test" {
  content  = data.vault_generic_secret.rds.data_json
  filename = "/tmp/temp.json"
}