resource "aws_instance" "dimbuADOPterraform" {
  ami = "ami-7abd0209"
  instance_type = "m4.xlarge"
  vpc_security_group_ids = ["${aws_security_group.dimbuADOPsecurityGroup.id}"]
  subnet_id = "${aws_subnet.dimbuSubnet.id}"
  key_name = "${aws_key_pair.ssh_key.key_name}"
  user_data = "${data.template_file.user_data.rendered}"

  ebs_block_device {
    device_name="/dev/sda1"
    delete_on_termination = true
    volume_size = 25
    volume_type = "${var.volume_type}"
  }

  ebs_block_device {
    device_name="/dev/sdf"
    delete_on_termination = false
    volume_size = 15
    volume_type = "${var.volume_type}"
  }

  ebs_block_device {
    device_name="/dev/sdg"
    delete_on_termination = false
    volume_size = 25
    volume_type = "${var.volume_type}"
  }

  ebs_block_device {
    device_name="/dev/sdh"
    delete_on_termination = false
    volume_size = 25
    volume_type = "${var.volume_type}"
  }

  tags {
    Name = "dimbuADOPterraform-workshop"
  }

}

resource "aws_key_pair" "ssh_key" {
    key_name = "${var.my_key_name}"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDTgQg4Jl6rj0YkryKI06CmqkAX9MKXLNWT0PkJSlgwBAnAmqMPAVXOnyXwQ0RyJG+55VOC0k1GiWkeHB5xTgvhZuKAxljV/AyJWM3bJ/4f1zsY2bPT8i1QzP8O25OIfDX7PWHBYbqUh9mT5OL982jzR6Q2NBcudhr8oc21+Ygl59HjkwLfMygp/KZCbUb9Xu1b/MXbMAYeuUahMI1ywuKD5veaHhQl4g4aF4lw0U6kJrnYuX96FmH4Zsmbzjv+hj6Yv+c7Ul4mz/C40zU+PrFocCVtBDIYXmrhXdIXUAXIB0l6yZitLsAcR+1/WgKWrQh6DPlUaVmIrxaHs/jfRCiW4BGbp8J8cffuzcbqdrsvRIGdn6TZgRc8ci9NDdStyQEikgiiuLxqXB/rReO/yjTDkVWqq/gV69IW0EcX90DMlYoAhNlW3yOcezSk2HbnOHMiLn8xrrjPY2EC9omE22dIimI3nuREr84L0l0tbcCJ4uguvrNDlY+Z6ohtngYD3BfFtyJiwz0ccuwQFsj41wJC5eMtK+K4TAAw5+hpzX3OYuWBxLZwnS2lOlNpROYySc5oy/w+/2HKID1aHMjOlBEXVmIo3BAJUtbDXS71/bfdPvIs4dwUdwzrPUyqaG9Lg1CQh1lh7drE2fvHPC+oQsjxuEmUhiEBvJCNRlrFCeCQoQ== dimbu.k.afonso@accenture.com"
}

data "template_file" "user_data" {
  template = "${file("user_data.tpl")}"
}