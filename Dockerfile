FROM debian:buster

RUN apt update && apt-get -y install build-essential libboost-all-dev libssl-dev

WORKDIR /opt/dnsseeder
COPY . .

RUN make

ENTRYPOINT [ "unbuffer", "/opt/dnsseeder/dnsseed" ]