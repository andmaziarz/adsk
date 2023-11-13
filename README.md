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

``ssh ec2-user@{IP} -i ~/id_student "bash -s" < example_remotely.sh``

## do narzędzi Continous Integration (CI) checkout this out

* Semantic versioning 2.0.0 do release tagów ``https://semver.org/`` 