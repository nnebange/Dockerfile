#specify the base image
# version 7 if not it will pull latest version
FROM centos:7  

#add a tag
LABEL maintainer="Clovisneba"

#update our packages #remember to put -y as it will be running inside the conatiner as it will come up and no one can enter yes
RUN yum update -y && yum clean all 

#install apache and create /var/www/html
RUN yum install -y httpd

#copy application inside the container
COPY index.html /var/www/html

#you want people to access your conatiner on a particular port/ port on which the conatiner should listen on during run time
EXPOSE 80

#we run httpd by doing systemctl start  httpd on ec2 but in conatiner it does not exist we will run it manually by using entry point
#when conatiner starts it should start httpd
## in linux there is a folder called usr and sbin where http service lives # you can use CMD as well
ENTRYPOINT [ "/usr/sbin/httpd" ] 

#if we run this conatiner it will exit. we don't want it to exit we want it to run in the background
CMD [ "-D", "FOREGROUND" ]
