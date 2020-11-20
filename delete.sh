#!/bin/bash
kubectl delete deploy nginx-deployment
kubectl delete svc nginx-svc
minikube stop
minikube delete
