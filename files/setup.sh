#!/bin/bash
chmod -R 777 /app/nemakiware
chmod -R 777 /share

git clone --branch dockerize https://github.com/aegif/nemakiware

cd /app/nemakiware && mvn install
cd /app/nemakiware/nemakiware/action && mvn install
cd /app/nemakiware/common && mvn install

cd /app/nemakiware/ui && activator clean
cd /app/nemakiware/ui && activator war

cd /app/nemakiware && mvn clean package
cd /app/nemakiware/core && mvn clean package
cd /app/nemakiware/solr && mvn clean package

cp /app/nemakiware/core/target/core.war /share/core.war
cp /app/nemakiware/ui/target/core.war /share/ui.war
cp /app/nemakiware/solr/target/core.war /share/solr.war