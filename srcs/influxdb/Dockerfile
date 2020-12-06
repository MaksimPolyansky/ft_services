FROM alpine

#install
RUN apk update && apk upgrade
RUN apk add openrc supervisor influxdb
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/

RUN mkdir -p /etc/telegraf
COPY ./srcs/telegraf.conf /etc/telegraf/telegraf.conf

COPY srcs/supervisord.conf /etc/supervisord.conf

EXPOSE 8086

#CMD [ "influxd" ]
CMD [ "/usr/bin/supervisord" ]
