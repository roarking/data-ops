FROM nimmis/java:oracle-7-jdk
MAINTAINER Alex Silva <alex-silva@pluralsight.com>

#Base image doesn't start in root
WORKDIR /

#Python repo
COPY conf/python.list /etc/apt/sources.list.d/python.list

#CDH 5 repo
COPY conf/cloudera.list /etc/apt/sources.list.d/cloudera.list

#CDH Prefs
COPY conf/cloudera.pref /etc/apt/preferences.d/cloudera.pref


#Add a GPG Key to the repository
RUN wget http://archive.cloudera.com/cdh5/ubuntu/trusty/amd64/cdh/archive.key -O archive.key && sudo apt-key add archive.key && \
    sudo apt-get update

#Install CDH package and dependencies
RUN sudo apt-get install -y zookeeper-server && \
    sudo apt-get install -y hadoop-conf-pseudo && \
    sudo apt-get install -y oozie && \
    sudo apt-get install -y python2.7 && \
    sudo apt-get install -y hue && \
    sudo apt-get install -y hue-plugins && \
    sudo apt-get install -y hive

#Copy updated config files
COPY conf/core-site.xml /etc/hadoop/conf/core-site.xml
COPY conf/hdfs-site.xml /etc/hadoop/conf/hdfs-site.xml
COPY conf/mapred-site.xml /etc/hadoop/conf/mapred-site.xml
COPY conf/hadoop-env.sh /etc/hadoop/conf/hadoop-env.sh
COPY conf/yarn-site.xml /etc/hadoop/conf/yarn-site.xml
COPY conf/hive-site.xml /etc/hadoop/conf/hive-site.xml
COPY conf/hue.ini /etc/hue/conf/hue.ini

RUN sudo -u hdfs hdfs namenode -format

COPY conf/run-hadoop.sh /usr/bin/run-hadoop.sh
RUN chmod +x /usr/bin/run-hadoop.sh

RUN sudo -u oozie /usr/lib/oozie/bin/ooziedb.sh create -run && \
    wget http://archive.cloudera.com/gplextras/misc/ext-2.2.zip -O ext.zip && \
    unzip ext.zip -d /var/lib/oozie

# NameNode
EXPOSE 8020 50070

# DataNodes
EXPOSE 50010 50020 50075

# ResourceManager
EXPOSE 8030 8031 8032 8033 8088

# NodeManager
EXPOSE 8040 8042

# JobHistoryServer
EXPOSE 10020 19888

# Hue
EXPOSE 8888


CMD ["/usr/bin/run-hadoop.sh"]
