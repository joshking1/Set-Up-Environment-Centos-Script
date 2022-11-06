#!/bin/bash
sudo yum -y update

sudo yum update -y

sudo amazon-linux-extras install -y lamp-mariadb10.2-php7.2 php7.2

sudo cat /etc/system-release

sudo yum install -y httpd mariadb-server

sudo systemctl start httpd

sudo systemctl enable httpd

sudo systemctl is-enabled httpd

echo "Install Java JDK 8"
sudo yum remove -y java  -y 
sudo amazon-linux-extras install java-openjdk11  -y 

echo "Install Maven"
yum install -y maven 

echo "Install git"
yum install -y git

amazon-linux-extras install epel
yum update -y
yum install ansible -y
yum install nginx -y
yum install python-pip -y  
yum install awscli -y 
yum install boto -y  

echo " Install Terraform"
sudo yum install update -y 
sudo wget https://releases.hashicorp.com/terraform/1.1.2/terraform_1.1.2_linux_amd64.zip 
sudo unzip terraform_1.1.2_linux_amd64.zip
sudo mv terraform /usr/bin/
terraform --version

echo "Install Docker engine"
yum update -y
yum install docker -y
systemctl start docker
systemctl enable docker
# systemctl status docker 
#sudo usermod -a -G docker jenkins
#sudo service docker start
sudo chkconfig docker on

echo " install Alpine"


echo "Install Jenkins"
docker run \
  -u root \
  --rm \
  -d \
  -p 8080:8080 \
  -p 50000:50000 \
  --name myjenkin \
  -v jenkins-data:/var/jenkins_home \
  -v /var/run/docker.sock:/var/run/docker.sock \
  jenkins/jenkins