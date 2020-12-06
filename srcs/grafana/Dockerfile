#OS
FROM alpine

#install
RUN apk update && apk upgrade
RUN apk add telegraf --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add grafana --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted
RUN apk add supervisor

#COPY srcs/start.sh start.sh
#COPY srcs/grafana.ini /usr/share/grafana/conf/custom.ini
#COPY srcs/datasources.yaml /usr/share/grafana/conf/provisioning/datasources/influxdb.yaml
#COPY srcs/dashboards.yaml /usr/share/grafana/conf/provisioning/dashboards/influxdb.yaml

#RUN mkdir -p /var/lib/grafana_dashboards/

RUN mkdir -p /etc/telegraf
COPY /srcs/telegraf.conf /etc/telegraf/telegraf.conf
COPY /srcs/grafana.db /usr/share/grafana/data/grafana.db
COPY /srcs/supervisord.conf /etc/supervisord.conf

#COPY srcs/dashboard.json /var/lib/grafana_dashboards/

EXPOSE 3000

#CMD [ "sh" , "start.sh" ]
CMD [ "/usr/bin/supervisord" ]
