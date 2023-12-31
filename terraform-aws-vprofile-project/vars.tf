variable AWS_REGION {
  default = "us-east-1"
}

variable AMIS {
  type = map
  default = {
    us-east-2  = "ami-05fb0b8c1424f266b"
    us-east-1  = "ami-0c7217cdde317cfec"
    us-west-1 = "ami-0ce2cb35386fc22e9"
  }
}

variable PRIV_KEY_PATH {
  default = "doingsvprofilekey"
}

variable PUB_KEY_PATH {
  default = "doingsvprofilekey.pub"
}

variable USERNAME {
  default = "ubuntu"
}

variable MYIP {
  default = "0.0.0.0/0"
}

variable rmquser {
  default = "rabbit"
}

variable rmqpass {
  default = "admin1234567"
}

variable dbuser {
  default = "admin"
}

variable dbpass {
  default = "admin123"
}

variable dbname {
  default = "accounts"
}

variable instance_count {
  default = "1"
}

variable VPC_NAME {
  default = "doingsvprofile-VPC"
}

variable Zone1 {
  default = "us-east-1a"
}

variable Zone2 {
  default = "us-east-1b"
}

variable Zone3 {
  default = "us-east-1c"
}

variable VpcCIDR {
  default = "172.21.0.0/16"
}


variable PubSub1CIDR {
  default = "172.21.1.0/24"
}

variable PubSub2CIDR {
  default = "172.21.2.0/24"
}

variable PubSub3CIDR {
  default = "172.21.3.0/24"
}

variable PrivSub1CIDR {
  default = "172.21.4.0/24"
}

variable PrivSub2CIDR {
  default = "172.21.5.0/24"
}

variable PrivSub3CIDR {
  default = "172.21.6.0/24"
}
