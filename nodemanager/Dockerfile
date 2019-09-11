FROM ja1le1/hadoop-base:2.0.0-hadoop3.1.2-java8

MAINTAINER Ivan Ermilov <ivan.s.ermilov@gmail.com>
MAINTAINER jaylee <812126839qq@gmail.com>

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
