FROM alpine

RUN apk update && apk upgrade

RUN apk add bash sudo nginx openssl openssh supervisor openrc
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted

RUN adduser -D -g 'www' www
RUN mkdir /www
RUN chown -R www:www /var/lib/nginx
RUN chown -R www:www /www
RUN mkdir /run/nginx

RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY srcs/supervisord.conf /etc/supervisord.conf
COPY srcs/default /etc/nginx/conf.d/default.conf
COPY srcs/index.html /www/index.html

RUN	adduser -D heusebio \
	&& echo 'heusebio:heusebio' | chpasswd \
	&& addgroup heusebio wheel \
	&& echo '%wheel ALL=(ALL) ALL' > /etc/sudoers.d/wheel \
	&& /usr/bin/ssh-keygen -A

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	-subj "/C=RU/ST=Moscow/L=Moscow/O=School21/CN=heusebio"

EXPOSE 80 443 22
CMD [ "/usr/bin/supervisord" ]
