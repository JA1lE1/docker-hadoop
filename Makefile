DOCKER_NETWORK = docker-hadoop_default
ENV_FILE = hadoop.env
current_branch := $(shell git rev-parse --abbrev-ref HEAD)
build:
	docker build -t ja1le1/hadoop-base:2.0.0-hadoop3.1.2-java8 ./base
	docker build -t ja1le1/hadoop-namenode:2.0.0-hadoop3.1.2-java8 ./namenode
	docker build -t ja1le1/hadoop-datanode:2.0.0-hadoop3.1.2-java8 ./datanode
	docker build -t ja1le1/hadoop-resourcemanager:2.0.0-hadoop3.1.2-java8 ./resourcemanager
	docker build -t ja1le1/hadoop-nodemanager:2.0.0-hadoop3.1.2-java8 ./nodemanager
	docker build -t ja1le1/hadoop-historyserver:2.0.0-hadoop3.1.2-java8 ./historyserver
	docker build -t ja1le1/hadoop-submit:2.0.0-hadoop3.1.2-java8 ./submit

wordcount:
	docker build -t hadoop-wordcount ./submit
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:2.0.0-hadoop3.1.2-java8 hdfs dfs -mkdir -p /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:2.0.0-hadoop3.1.2-java8 hdfs dfs -copyFromLocal /opt/hadoop-3.1.2/README.txt /input/
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} hadoop-wordcount
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:2.0.0-hadoop3.1.2-java8 hdfs dfs -cat /output/*
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:2.0.0-hadoop3.1.2-java8 hdfs dfs -rm -r /output
	docker run --network ${DOCKER_NETWORK} --env-file ${ENV_FILE} bde2020/hadoop-base:2.0.0-hadoop3.1.2-java8 hdfs dfs -rm -r /input
