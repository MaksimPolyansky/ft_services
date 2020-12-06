#OS
FROM alpine

#install
RUN apk update && apk upgrade
RUN apk add nginx supervisor openrc
RUN apk add php7 php7-fpm php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir -p /www/
RUN mkdir /run/nginx

RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

#phpmyadmin
RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz
RUN tar -xvzf phpMyAdmin-5.0.4-all-languages.tar.gz
RUN mv phpMyAdmin-5.0.4-all-languages /www/phpmyadmin
RUN rm phpMyAdmin-5.0.4-all-languages.tar.gz
COPY srcs/config.inc.php /www/phpmyadmin/

COPY srcs/nginx /etc/nginx/conf.d/default.conf
RUN chmod 777 /run/nginx

#COPY srcs/start.sh start.sh
#RUN chmod 777 start.sh

COPY srcs/supervisord.conf /etc/supervisord.conf

RUN mkdir www/phpmyadmin/tmp
RUN chmod 777 www/phpmyadmin/tmp

EXPOSE 5000

#CMD [ "sh" , "start.sh" ]
CMD [ "/usr/bin/supervisord" ]
