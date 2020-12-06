FROM alpine

#install
RUN apk update && apk upgrade
RUN apk add vsftpd supervisor openssl openrc
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

#ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout /etc/ssl/private/vsftpd.key \
    -out /etc/ssl/certs/vsftpd.crt \
    -subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=heusebio"

RUN adduser -D -h /var/ftp heusebio; echo "heusebio:root" | chpasswd

RUN mkdir -p /var/ftp

COPY srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf

#COPY srcs/start.sh start.sh
#RUN chmod 777 start.sh

COPY srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 20 21 30000

#CMD [ "sh" , "start.sh" ]
CMD [ "/usr/bin/supervisord" ]
