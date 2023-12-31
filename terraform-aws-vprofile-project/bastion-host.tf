resource "aws_instance" "doingsvprofile-bastion" {
  ami                    = lookup(var.AMIS, var.AWS_REGION)
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.doingsvprofilekey.key_name
  subnet_id              = module.vpc.public_subnets[0]
  count                  = var.instance_count
  vpc_security_group_ids = [aws_security_group.doingsvprofile-bastion-sg.id]

  tags = {
    Name    = "doingsvprofile-bastion"
    PROJECT = "doingsvprofile"
  }

  provisioner "file" {
    source      = templatefile("templates/db-deploy.tmpl", { rds-endpoint = aws_db_instance.doingsvprofile-rds.address, dbuser = var.dbuser, dbpass = var.dbpass })
    destination = "~/tmp/doingsvprofile-dbdeploy.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/doingsvprofile-dbdeploy.sh",
      "sudo /tmp/doingsvprofile-dbdeploy.sh"
    ]
  }

  connection {
    user        = var.USERNAME
    private_key = file(var.PRIV_KEY_PATH)
    host        = self.private_ip
  }
  depends_on = [aws_db_instance.doingsvprofile-rds]
}
