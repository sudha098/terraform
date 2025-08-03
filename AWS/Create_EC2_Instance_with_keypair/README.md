Please generate public and private key first.

ssh-keygen
give name: sudha

now you will see two files: sudha, sudha.pub

copy pub file in terraform working directory.



#######################

After instance you can access the instance by allowing ssh port in Security group.

$ ssh -i sudha ec2-user@Public_IP_of_Instance