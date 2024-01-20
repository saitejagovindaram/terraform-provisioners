resource "aws_instance" "local_exec_practice" {
    ami = "ami-03265a0778a880afb"
    instance_type = "t3.micro"
    vpc_security_group_ids = [ aws_security_group.remote_exec.id ]
    tags = {
        "Name" = "localexec"
    }

    connection {
        type     = "ssh"
        user     = "centos"
        password = "DevOps321"
        host     = self.public_ip
    }

    provisioner "remote-exec" {
        inline = [ 
            "echo I am learning provisioners in Terraform &> /tmp/sample.txt"
         ]
    }
    provisioner "remote-exec" {
        inline = [ 
            "sudo yum install nginx -y",
            "sudo wget https://www.tooplate.com/zip-templates/2136_kool_form_pack.zip",
            "sudo rm -rf /usr/share/nginx/html/*",
            "unzip 2136_kool_form_pack.zip",
            "sudo cp -r 2136_kool_form_pack/* /usr/share/nginx/html/",
            "sudo systemctl start nginx"
         ]
    }
}

resource "aws_security_group" "remote_exec" {
  name = "remote-exec"
  description = "remote-exec"

  ingress {
    description      = "Inboud Traffic"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0" ]
  }
  ingress {
    description      = "Inboud Traffic"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = [ "0.0.0.0/0" ]
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
        Name = "remote-exec-practice"
    }
}