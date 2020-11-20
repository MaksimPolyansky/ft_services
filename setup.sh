#!/bin/bash
minikube start --vm-driver=docker

eval $(minikube docker-env)

minikube addons enable metallb

kubectl apply -f ./srcs/metallb.yaml


#nginx
docker build -t nginx_image ./srcs/nginx
kubectl apply -f ./srcs/nginx.yaml

#wordpress

#phpmyadmin

#mysql

#ftps

#grafana

#influxdb

