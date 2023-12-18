#!/bin/bash

NAME=${NAME:="Amdrzej"}
PACKAGES_TO_BE_INSTALLED="cowsay mc tree"
APP_URL=${APP_URL:="https://github.com/jkanclerz/computer-programming-4/releases/download/v1.30/my-ecommerce-0.1.jar"}
APP_DIR=/opt/ecommerce
APP_NAME=ecommerce

echo "HELLO $NAME"
dnf install -y ${PACKAGES_TO_BE_INSTALLED}

## install java
dnf install -y java-17-amazon-corretto
java -version

## dir structure
mkdir -p ${APP_DIR}

## going to download app.jar
wget -O ${APP_DIR}/${APP_NAME}.jar ${APP_URL}

#java -Dserver.port=80 -jar /opt/ecommerce/app.jar

systemdTemplate="
[Unit]
Description=My ${APP_NAME} service
After=network-online.target

[Service]
Type=simple
User=root
ExecStart=java -Dserver.port=80 -jar ${APP_DIR}/${APP_NAME}.jar
Restart=always

[Install]
WantedBy=multi-user.target
"

echo -e "$systemdTemplate" > /etc/systemd/system/${APP_NAME}.service

systemctl daemon-reload
systemctl enable ${APP_NAME}
systemctl restart ${APP_NAME}

cowsay "it works"