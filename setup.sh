#!/bin/bash
minikube start --vm-driver=docker

eval $(minikube docker-env)

minikube dashboard &


# Make metallb
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml


#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml


#wordpress
#docker build -t wordpress_image ./srcs/wordpress
#kubectl apply -f srcs/wordpress/wordpress.yaml


#phpmyadmin
#docker build -t phpmyadmin_image ./srcs/phpmyadmin
#kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml


#mysql
#docker build -t mysql_image ./srcs/MySQL
#kubectl apply -f srcs/MySQL/mysql.yaml
#kubectl apply -f srcs/MySQL/mysql_volume.yaml


#ftps
#docker build -t ftps_image ./srcs/FTPS
#kubectl apply -f srcs/FTPS/ftps.yaml


#grafana
#docker build -t grafana_image ./srcs/Grafana
#kubectl apply -f srcs/Grafana/grafana.yaml


#influxdb
#docker build -t influxdb_image ./srcs/InfluxDB
#kubectl apply -f srcs/InfluxDB/influxdb-volume.yaml
#kubectl apply -f srcs/InfluxDB/influxdb-configmap.yaml
#kubectl apply -f srcs/InfluxDB/influxdb.yaml


#telegraf
#docker build -t telegraf_image ./srcs/Telegraf
#kubectl apply -f srcs/Telegraf/telegraf.yaml
