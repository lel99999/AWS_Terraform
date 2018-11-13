resource "aws_instance" "dev01" {
  ami = "ami-6871a115"
  instance_type = "t2.micro"
#  vpc_security_group_ids = ["vpc-28675b41"]
  subnet_id = "subnet-5105e318"
# vpc_security_group_ids = ["${aws_security_group.dev01.id}"]
# subnet_id = "${aws_subnet.us-east-1a-private.id}"
#security_groups = [
#  "${aws_security_group.allow_ssh.name}", 
#  "${aws_seucrity_group.allow_outbound.name}"
#]
# output "public_ip" {
#   value = "${aws_instance.dev01.public_ip}"
# }

  tags {
    name = "dev01"
  }
}
