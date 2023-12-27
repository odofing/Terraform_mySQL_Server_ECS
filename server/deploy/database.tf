resource "aws_db_subnet_group" "main" {
  # name = "${local.prefix}-main"
  name = "blog"
  subnet_ids = [
    aws_subnet.private_a.id,
    aws_subnet.private_b.id
  ]

    tags = merge(
      local.common_tags,
      tomap({"Name" = "${local.prefix}-db"})
    )
}

resource "aws_security_group" "rds" {
  description = "Allow access to the RDS database instance."
  name        = "${local.prefix}-rds-inbound-access"
  vpc_id      = aws_vpc.main.id

  ingress {
    protocol  = "tcp"
    from_port = 3306
    to_port   = 3306
  }

  tags = local.common_tags
}

resource "aws_db_instance" "main" {
  # identifier              = "${local.prefix}-db"
  identifier              = "admin"
  allocated_storage       = 20
  db_name                 = "blog"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "8.0.35"
  instance_class          = "db.t2.micro"
  db_subnet_group_name    = aws_db_subnet_group.main.name
  password                = var.db_password
  username                = var.db_username
  backup_retention_period = 0
  multi_az                = false
  skip_final_snapshot     = true
  vpc_security_group_ids  = [aws_security_group.rds.id]

    tags = merge(
      local.common_tags,
      tomap({"Name" = "${local.prefix}-db"})
    )
}
