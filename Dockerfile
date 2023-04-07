FROM rockylinux:8

MAINTAINER hasan

RUN echo "Copying Nginx Repo"
COPY nginx.repo /etc/yum.repos.d/

RUN echo "Installing"
RUN dnf update -y
RUN dnf upgrade -y
RUN dnf install epel-release -y
RUN dnf install http://rpms.remirepo.net/enterprise/remi-release-8.rpm -y
RUN dnf module reset php -y
RUN dnf module install php:remi-8.2 -y
RUN dnf update -y
RUN dnf upgrade -y
RUN dnf install php -y
RUN dnf install nginx -y
RUN dnf install supervisor -y
#RUN dnf install --enablerepo=nginx-stable nginx -y
RUN mkdir /home/www
RUN mkdir /run/php-fpm

COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /etc/php-fpm.d/www.conf
COPY index.php /home/www
#COPY nginx.conf.bak /etc/nginx/nginx.conf
COPY default.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf

#EXPOSE 80

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]
#CMD ["/usr/sbin/nginx", "-g", "daemon off;"]