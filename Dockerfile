FROM debian:buster

RUN apt update && apt-get -y install build-essential libboost-all-dev libssl-dev

WORKDIR /opt/dnsseeder
COPY . .

RUN make

ENTRYPOINT [ "/opt/dnsseeder/dnsseed", "-h", "$HOSTNAME", "-n", "$NAMESERVER", "-m", "$MAIL", "&", "disown", "&&", "tail", "-f", "--retry", "/opt/dnsseeder/dnsseeder.log" ]