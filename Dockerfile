#!/usr/bin/docker
FROM stromsw/ubuntu-java
#export Java home
#ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
ENV CATALINA_OPTS -server -Xms512m -Xmx2g -Xss256k -XX:PermSize=128m -XX:MaxPermSize=256m -XX:+UseG1GC
RUN curl -L -o /tmp/artifactory-3.6.0.zip https://bintray.com/artifact/download/jfrog/artifactory/artifactory-3.6.0.zip&& \
cd /tmp && \
unzip artifactory-3.6.0.zip && \
mkdir -p /opt/jfrog/ && \
mv artifactory-3.6.0/ /opt/jfrog/artifactory && \
rm /tmp/artifactory*.zip
ENV ARTIFACTORY_HOME /opt/jfrog/artifactory
VOLUME /opt/jfrog/artifactory/logs
VOLUME /opt/jfrog/artifactory/data
VOLUME /opt/jfrog/artifactory/backup
EXPOSE 8081
CMD $ARTIFACTORY_HOME/bin/artifactory.sh start
