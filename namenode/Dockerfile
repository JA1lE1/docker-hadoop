FROM ja1le1/hadoop-base:2.0.0-hadoop3.1.2-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>
MAINTAINER jaylee <812126839qq@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:9870/ || exit 1

ENV HDFS_CONF_dfs_namenode_name_dir=file:///hadoop/dfs/name
RUN mkdir -p /hadoop/dfs/name
VOLUME /hadoop/dfs/name

ADD run.sh /run.sh
RUN chmod a+x /run.sh
RUN apt-get update  && apt-get install -y openssh-server \
        vim \
        ufw \
    && rm -rf /var/lib/apt/lists/*

EXPOSE 9870

CMD ["/run.sh"]
