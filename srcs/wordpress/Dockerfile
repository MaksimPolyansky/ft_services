#OS
FROM alpine

#install
RUN apk update && apk upgrade
RUN apk add nginx supervisor openrc
RUN apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir -p /www/

RUN mkdir -p /etc/telegraf
COPY /srcs/telegraf.conf /etc/telegraf/telegraf.conf

#wordpress
RUN wget https://wordpress.org/latest.tar.gz
RUN tar -xvzf latest.tar.gz
RUN mv wordpress /www/ && rm latest.tar.gz
COPY srcs/wp-config.php /www/
RUN	chmod 777 /www

#COPY srcs/start.sh start.sh
#RUN	chmod 777 start.sh

COPY srcs/nginx /etc/nginx/conf.d/default.conf
RUN mkdir -p /run/nginx
RUN chmod -R 777 /run/nginx

COPY srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 5050

#CMD [ "sh" , "start.sh" ]
CMD [ "/usr/bin/supervisord" ]
