FROM holandajunior/alpine-activator

ENV MAVEN_VERSION 3.6.3
ENV MAVEN_HOME /usr/lib/mvn
ENV PATH $MAVEN_HOME/bin:$PATH

RUN wget http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  tar -zxvf apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
  mv apache-maven-$MAVEN_VERSION /usr/lib/mvn

RUN apk add bash
RUN apk --update add git less openssh && \
    rm -rf /var/lib/apt/lists/* && \
    rm /var/cache/apk/*

#RUN git clone --branch dockerize https://github.com/aegif/nemakiware

# COPY . /app
COPY ./files/setup.sh /home/scripts/setup.sh
COPY ./files/activator-launch-1.2.10.jar /root/.ivy2/local/com.typesafe.activator/activator-launcher/1.2.10/jars/activator-launcher.jar
COPY ./files/repositories /root/.sbt/repositories.txt
RUN chmod 777 /home/scripts/setup.sh

RUN chmod 777 /app