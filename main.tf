terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = ""

    workspaces {
      prefix = "dev-"
    }
  }
}


provider "aws" {
  region     = "eu-west-2"
}


resource "aws_instance" "web" {
  ami           = "ami-02e42a8490e212d0a"
  instance_type = "t2.micro"

  tags = {
    Name = "dev-${terraform.workspace}" ##we want this to be refereced the prefix and workspace at once
  }
}
