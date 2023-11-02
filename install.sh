#!/bin/bash

sudo chmod +x /home/ec2-user/archivos-de-configuracion/docker-compose.yml
#actualización de repositorios y paquetes
sudo yum update -y

#instalacion de Docker
sudo yum install -y docker
sudo docker info

#inicializar docker
sudo systemctl start docker

#instalacion Git
sudo yum install git -y

#Confirmar version de Git
git --version

#realizar login de docker (cambiar las variables que estan entre <>)
#DOCKER_USERNAME=<tu_nombre_de_usuario_de_Docker_Hub>
#DOCKER_PASSWORD=<tu_contraseña_de_Docker_Hub>
#sudo echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

#levantamiento contenedores petplate despues de realizar push del front
sudo docker pull postgres
sudo docker pull mongo
sudo docker pull juan172/no-touch-front:v1.0
sudo docker pull juan172/no-touch-backend1:v1.0
sudo docker pull juan172/no-touch-backend2:v1.0
sudo docker pull juan172/no-touch-microservice-alarm:v1.0

#Despues de crear y configurar el docker-compose, instalar las dependencias del mismo

sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo docker-compose --version

#Inicializar el docker compose
sudo docker-compose up -d