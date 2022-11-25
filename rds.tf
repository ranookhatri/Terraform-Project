# # Creating RDS Instance
# resource "aws_db_subnet_group" "web-rds-subnet-grp" {
#   name       = "web-rds-subnet-grp"
#   subnet_ids = [aws_subnet.application-subnet-1.id, aws_subnet.database-subnet-1.id]
#   tags = {
#     Name = "web-rds-subnet-sg"
#   }
# }
# resource "aws_db_instance" "rds" {
#   allocated_storage    = 10
#   db_subnet_group_name = aws_db_subnet_group.web-rds-subnet-grp.id
#   engine               = "mysql"
#   engine_version       = "8.0.30"
#   instance_class       = "db.t2.micro"
#   # multi_az               = true
#   db_name                = "mydb"
#   username               = "myrds"
#   password               = "myrds12345"
#   skip_final_snapshot    = true
#   vpc_security_group_ids = [aws_security_group.database-sg.id]
# }

