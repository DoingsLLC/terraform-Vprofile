resource "aws_db_subnet_group" "doingsvprofile-rds-subgrp" {
  name       = "doings_main"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "Doings subnet group for RDS"
  }
}

resource "aws_elasticache_subnet_group" "doingsvprofile-ecache-subgrp" {
  name       = "doingsvprofile-ecache-subgrp"
  subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
  tags = {
    Name = "Doings subnet group for elasticache"
  }
}

resource "aws_db_instance" "doingsvprofile-rds" {
  identifier             = "doings-db"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.35"
  instance_class         = "db.t2.micro"
  db_name                = var.dbname
  username               = var.dbuser
  password               = var.dbpass
  parameter_group_name   = "default.mysql8.0"
  multi_az               = "false"
  publicly_accessible    = "false"
  skip_final_snapshot    = true
  db_subnet_group_name   = aws_db_subnet_group.doingsvprofile-rds-subgrp.name
  vpc_security_group_ids = [aws_security_group.doingsvprofile-backend-sg.id]
}

resource "aws_elasticache_cluster" "doingsvprofile-cache" {
  cluster_id           = "doingsvprofile-cache"
  engine               = "memcached"
  node_type            = "cache.t2.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.memcached1.6"
  port                 = 11211
  security_group_ids   = [aws_security_group.doingsvprofile-backend-sg.id]
  subnet_group_name    = aws_elasticache_subnet_group.doingsvprofile-ecache-subgrp.name
}

resource "aws_mq_broker" "doingsvprofile-rmq" {
  broker_name        = "doingsvprofile-rmq"
  engine_type        = "ActiveMQ"
  engine_version     = "5.17.6"
  host_instance_type = "mq.t2.micro"
  security_groups    = [aws_security_group.doingsvprofile-backend-sg.id]
  subnet_ids         = [module.vpc.private_subnets[0]]

  user {
    username = var.rmquser
    password = var.rmqpass
  }
}
