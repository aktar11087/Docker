FROM maven:3.6.3-jdk11-d420437
RUN mkdir -p /ah/akplus
RUN /usr/sbin/groupadd -g 1024 akplus
RUN /usr/sbin/useradd -d /cs/akplus -c "IWM 2.0 AKPLUS User" -g akplus -u 1024 -M akplus
RUN mkdir -p /ah/akplus/var/log
RUN mkdir -p /ah/akplus/crime-master
COPY scripts/start-service.sh /ah/akplus/crime-master/start-service.sh
RUN chmod 777 /ah/akplus/crime-master/start-service.sh
COPY service.jar /ah/akplus/crime-master/crime-master.jar
RUN chown -R akplus:akplus /ah/akplus
RUN chmod -R 777 /ah/akplus
WORKDIR /ah/akplus/crime-master
ENTRYPOINT java -Xmx4096M -Dapplication-id=crime-master -Djasypt.encryptor.password=xxxxxxxxxxxxxx -Xlog:gc*:file=/ah/akplus/var/log/gc.log -jar crime-master.jar
