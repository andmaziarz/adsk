#!/bin/bash
repoCfg="
[mariadb]
name = MariaDB

baseurl = https://ftp.bme.hu/pub/mirrors/mariadb/yum/11.1/centos/9.2/x86_64

gpgkey = https://ftp.bme.hu/pub/mirrors/mariadb/yum/RPM-GPG-KEY-MariaDB
gpgcheck = 1
"
echo "$repoCfg" > /etc/yum.repos.d/MariaDB.repo

dnf install -y MariaDB-server MariaDB-client
systemctl enable mariadb
systemcl start mariadb