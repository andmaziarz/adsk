#  JAVA APP 

## ARRANGE

1. mam instancje
2. mam dostep do instancji
    * ``ssh ec2-user@{IP} -i id_student``
    ``student1``
3. mam repo
    * ``https://github.com/andmaziarz/adsk``

4. opcjonalny edu instance
    * ``ssh s{album}@csa.edu.jkan.pl`` ``uekcracow2023@!``

## ACT

3. install maven
* download ``https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz``
* ``wget https://dlcdn.apache.org/maven/maven-3/3.9.5/binaries/apache-maven-3.9.5-bin.tar.gz``

4. kompilacja
* ``mvn compile``

## ASSERT

open: http://123.123.123:11 -> our app

## run bash remotely

``ssh ec2-user@{IP} -i ~/id_student "bash -s" < install_java_app.sh``

## do narzędzi Continous Integration (CI) checkout this out

* Semantic versioning 2.0.0 do release tagów ``https://semver.org/`` 

## mariadb sql 

1. instalujemy mariadb
``dnf install mariadb105-server``

2. status serwera
``sudo systemctl status mariadb`` 

3. autostart i uruchomienie
``sudo systemctl enable mariadb``
``sudo systemctl start mariadb``

4. wejscie do mariadb
``sudo mysql -u root``
``create database my_db;``

5. utworz skrypcik sql
`` echo "select now() my_time, 2+2 equasion, 'hello world' as hello" > my_sql.sql ``

6. uruchom 
``sudo mysql -u root my_db < my_sql.sql > result.txt``

## mechanizm automatycznego uruchomienia maszyny (AWS EC2)
- autostart/autoexec
- jesli sie wywali, to uruchomienie ponownie
- sprawdzić, żeby nie uruchamiała się wiecej niż 2 razy (np. proces PID)
- konfiguracja zmiennych środowiskowych, przekazane w momencie uruchomienia
- przy użyciu ``systemd`` oraz ``etc/init.d`` 


## docker

1. instalujemy
`` sudo dnf install docker -y ``
`` sudo systemctl start docker ``
`` sudo docker --version ``

2. pierwszy hello world
`` sudo docker run alpine sh -c "echo 'hello world'" ``

3.  apache i nginx
`` sudo docker run -d -p 8080:80 httpd:2.4.12 ``
`` sudo docker run -d -p 80:80 nginx:latest ``
`` sudo docker rm -f CONTAINER_ID ``

4. config Dockerfile 

FROM alpine:latest

RUN apk add openjdk17

RUN mkdir -p /opt/ecommerce

RUN wget https://github.com/jkanclerz/computer-programming-4/releases/download/v1.30/my-ecommerce-0.1.jar -O /opt/ecommerce/app.jar

RUN adduser ecommerce --disabled-password

USER ecommerce

EXPOSE 8080
 
CMD ["/usr/bin/java", "-Dserver.port=8080", "-jar", "/opt/ecommerce/app.jar"] 

5. build

`` sudo docker build -t my_ecommerce ./ ``
`` sudo docker run --name my_sexy_app -d -p 80:8080 my_ecommerce ``