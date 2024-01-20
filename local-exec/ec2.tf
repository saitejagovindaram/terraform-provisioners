resource "aws_instance" "local_exec_practice" {
  ami = "ami-03265a0778a880afb"
  instance_type = "t3.micro"
  vpc_security_group_ids = [ "sg-0a497d2564ffe86fd" ]
  tags = {
    "Name" = "localexec"
  }

  provisioner "local-exec" {
    command = "echo The server's Ip address is ${self.public_ip}"
  }

  provisioner "local-exec" {
    command = "echo ${self.public_ip} > inventory"
  }

  provisioner "local-exec" {
    when = destroy # by default it is create
    command = "echo destroying the server ${self.public_ip}"
  }
  provisioner "local-exec" {
    command = "dsflsjdlfjsld"
    on_failure = continue
  }
  provisioner "local-exec" {
    command = "echo Hello" 
    on_failure = fail
  }
#   provisioner "local-exec" {
#     command = "dsflsjdlfjsld" # given is wrong command so terraform has to stop the execution here, as it is continue it will ignore, by default it is fail
#     on_failure = fail
#   }
  
}
