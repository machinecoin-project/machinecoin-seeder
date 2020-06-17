FROM debian:buster

RUN apt update && apt-get -y install build-essential libboost-all-dev libssl-dev

WORKDIR /opt/dnsseeder
COPY . .

RUN make

ENTRYPOINT [ "stdbuf", "-i0", "-o0", "-e0", "/opt/dnsseeder/dnsseed" ]