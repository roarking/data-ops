#Creates a CDH 5.4.2 pseudo-distributed Docker image

This image contains a basic CDH 5 install of Hadoop 2 with YARN. Very useful for local developmeent and testing without going to AWS.

#####What gets Installed
* HDFS
* YARN
* JobHistoryServer
* Oozie
* Hue
* Hive

###Building the image
	docker build -t cdh5-img .

Run image with the default port mapping

    docker run --name cdh5 -d -p 8020:8020 -p 50070:50070 -p 50010:50010 -p 50020:50020 -p 50075:50075 -p 8030:8030 -p 8031:8031 -p 8032:8032 -p 8033:8033 -p 8088:8088 -p 8040:8040 -p 8042:8042 -p 10020:10020 -p 19888:19888 -p 11000:11000 -p 8888:8888 -p 9999:9999 cdh5-img


###Web entry points
* name node - http://localhost:50070
* resource manager - http://localhost:8088
* job history server - http://localhost:19888
* oozie console - http://localhost:11000
* hue - http://localhost:8888

If you are running this on a Mac, remember to use boot2docker's IP address and not localhost.

boot2docker comes with a command to get the IP address of the VM:

> boot2docker ip