#OS
FROM alpine:latest

#install
RUN apk update && apk upgrade
RUN apk add nginx openssl openssh supervisor openrc

#ssl
RUN openssl req -newkey rsa:2048 -x509 -sha256 \
	-days 365 -nodes -out /etc/ssl/heusebio.crt \
	-keyout /etc/ssl/heusebio.key \
	-subj "/C=RU/ST=Russia/L=Moscow/O=School 21/OU=heusebio/CN=valenok"

#ssh
RUN adduser -D 'valenok' && echo "valenok:password" | chpasswd

RUN mkdir /www/
COPY index.html style.css /www/

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY start.sh /tmp/start.sh

COPY supervisor.conf /etc/supervisor.conf

RUN chmod +x /tmp/start.sh

EXPOSE 80 443 22

CMD [ "/tmp/start.sh" ]
