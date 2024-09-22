# ansible_core_on_ec2
This will create an ec2 instance and install ansible on it.
This is to test any ansible playbook.

- Create a key pair in pem file format and mention it in main.tf file.
  -   Line 8 -> key_name      = "aws_kub"          # Replace with your key pair name
  -   Line 21 -> private_key = file(""E:\terraform\aws_kub.pem"") # Path to your private key
- Using PuTTY Key Gen -> Load pem file and Save private key(as ppk)
- Use private key(ppk) in PuTTY and login to ec2 server.
- In PuTTY -> Connection-SSH-Auth-Upload ppk file
- Session -> Hostname -> ec2-user@public ip address
