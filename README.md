# terraform-example-1-aws-ec2-instance-creation
terraform-example-1-aws-ec2-instance-creation

## Create an AWS Instance using terraform
- https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- Generate a key in local and assign to newly created instance
- create a security group and assign the group to newly created instance
~~~
ssh-keygen -t rsa -f ./id_rsa -N ""
~~~
- Here's what each part does:
  - -t rsa: Specifies the RSA key type.
  - -f ./id_rsa: Specifies the filename to save the key in the current directory (./id_rsa).
  - -N "": Specifies an empty passphrase (i.e., no password).


## Access remotely EC2 using below command with public key of the ec2 instance
~~~
ssh -i "id_rsa" ec2-user@43.205.140.102        
yum install nginx
service nginx start

access http://43.205.140.102/
~~~

