FROM ubuntu:trusty
RUN apt-get update && apt-get install -yq autoconf automake bison flex g++ git libboost-all-dev libtool make pkg-config ragel libmysqlclient-dev curl
ADD . /app
WORKDIR /app
RUN cd /app && ./bootstrap && ./configure --with-modules="remote" && make && make install
EXPOSE 53/udp 53/tcp
ENTRYPOINT ["pdns_server"]
