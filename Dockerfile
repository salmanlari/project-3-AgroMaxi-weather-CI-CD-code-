FROM ubuntu 
RUN apt update  && apt install nginx -y
#COPY /home/admin1/Documents/docker_repo/ecomm-master/* /var/www/html/
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]