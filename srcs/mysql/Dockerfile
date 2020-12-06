#OS
FROM alpine

#install
RUN apk update && apk upgrade
RUN apk add openrc mysql mysql-client supervisor
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir /run/mysqld
RUN chown -R mysql /run/mysqld

COPY srcs/heusebio.sql heusebio.sql
COPY srcs/start.sh start.sh
COPY srcs/my.cnf /etc/my.cnf
COPY srcs/mysql.sql mysql_conf.sql
COPY ./srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 3306

CMD [ "sh" , "start.sh" ]
