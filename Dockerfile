FROM ubuntu:14.04

# Installation:
# Import MongoDB public GPG key AND create a MongoDB list file
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
RUN echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/10gen.list

# Update apt-get sources AND install MongoDB

ENV MONGO_VERSION 2.2.7
RUN apt-get update && apt-get install -y mongodb-org=$MONGO_VERSION mongodb-org-server=$MONGO_VERSION mongodb-org-shell=$MONGO_VERSION mongodb-org-mongos=$MONGO_VERSION mongodb-org-tools=$MONGO_VERSION

VOLUME /data/db

COPY docker-entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 27017
CMD ["mongod"]