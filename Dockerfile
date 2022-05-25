FROM influxdb:2.0.4
USER root
RUN mkdir -p /home/influxdb/health
WORKDIR /home/influxdb/health
COPY package.json ./
COPY index.js ./
COPY start.sh /home/influxdb/start.sh
RUN chmod +x /home/influxdb/start.sh
RUN apt-get update
RUN apt-get -y install nodejs
RUN apt-get -y install npm
RUN npm install
USER influxdb
ENV DOCKER_INFLUXDB_INIT_MODE=setup
ENV DOCKER_INFLUXDB_INIT_USERNAME=admin
ENV DOCKER_INFLUXDB_INIT_PASSWORD=Uwk85r54
ENV DOCKER_INFLUXDB_INIT_ORG=BetssonGroup
ENV DOCKER_INFLUXDB_INIT_BUCKET=PopularityIndexBucket
ENV DOCKER_INFLUXDB_INIT_RETENTION=6d
ENV DOCKER_INFLUXDB_INIT_ADMIN_TOKEN=C-iBtYvCUpo5JmNK_uxM0kNmfYKRNcdochB8xW5d20k-8DVICCk3NyE93-zmodrPlCrTjniA53LwEst_qkal1g==
ENTRYPOINT ["/home/influxdb/start.sh"]
EXPOSE 8086