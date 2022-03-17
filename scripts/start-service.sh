#!/bin/bash

cd /ah/akplus/crime-master

java -Xmx4096M -jar crime-master.jar -Dapplication-id=crime-master -Dspring.profiles.active=qa -Xlog:gc*:file=/ah/akplus/var/log/gc.log
