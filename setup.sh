#!/bin/bash
minikube start --vm-driver=docker

eval $(minikube docker-env)

minikube dashboard &


# Make metallb & volume
minikube addons enable metallb
kubectl apply -f srcs/metallb.yaml
kubectl apply -f srcs/volumes.yaml


#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f srcs/nginx/nginx.yaml


#wordpress
docker build -t wordpress_image ./srcs/wordpress
kubectl apply -f srcs/wordpress/wordpress.yaml


#phpmyadmin
docker build -t phpmyadmin_image ./srcs/phpmyadmin
kubectl apply -f srcs/phpmyadmin/phpmyadmin.yaml


#mysql
docker build -t mysql_image ./srcs/mysql
kubectl apply -f srcs/mysql/mysql.yaml


#ftps
docker build -t ftps_image ./srcs/ftps
kubectl apply -f srcs/ftps/ftps.yaml


#grafana
docker build -t grafana_image ./srcs/grafana
kubectl apply -f srcs/grafana/grafana.yaml


#influxdb
docker build -t influxdb_image ./srcs/influxdb
kubectl apply -f srcs/influxdb/influxdb.yaml


#telegraf
#docker build -t telegraf_image ./srcs/telegraf
#kubectl apply -f srcs/telegraf/telegraf.yaml

# check
# kubectl exec deploy/ftps-deployment -- pkill vsftpd
# kubectl exec deploy/grafana-deployment -- pkill grafana
# kubectl exec deploy/telegraf-deployment -- pkill telegraf
# kubectl exec deploy/influxdb-deployment -- pkill influxd
# kubectl exec deploy/wordpress-deployment -- pkill nginx
# kubectl exec deploy/wordpress-deployment -- pkill php-fpm7
# kubectl exec deploy/phpmyadmin-deployment -- pkill nginx
# kubectl exec deploy/phpmyadmin-deployment -- pkill php-fpm7
# kubectl exec deploy/mysql-deployment -- pkill /usr/bin/mysqld
# kubectl exec deploy/nginx-deployment -- pkill nginx
# kubectl exec deploy/nginx-deployment -- pkill sshd
