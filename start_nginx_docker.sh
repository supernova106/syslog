#!/bin/bash

CONTAINER_NAME="nginx"

docker rm -f ${CONTAINER_NAME}
docker run -d \
	--name ${CONTAINER_NAME} \
	-p 8080:80 \
	--log-driver=syslog \
	nginx
