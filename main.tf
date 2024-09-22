provider "aws" {
  region = "us-east-1" # Change to your desired region
}

resource "aws_instance" "ansible_instance" {
  ami           = "ami-0c55b159cbfafe1f0" # Change to a valid AMI ID for your region
  instance_type = "t2.micro"              # Change to your desired instance type
  key_name      = "aws_kub"          # Replace with your key pair name

  # Use a provisioner to install Ansible
  provisioner "remote-exec" {
    inline = [
      "sudo yum update -y",
      "sudo yum install -y python3-pip",
      "sudo pip3 install ansible",
    ]

    connection {
      type     = "ssh"
      user     = "ec2-user"                 # Change if using a different AMI
      private_key = file(""E:\terraform\aws_kub.pem"") # Path to your private key
      host     = self.public_ip
    }
  }

  tags = {
    Name = "AnsibleInstance"
  }
}

output "instance_ip" {
  value = aws_instance.ansible_instance.public_ip
}
