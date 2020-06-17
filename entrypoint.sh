#!/bin/bash

set -x

/opt/dnsseeder/dnsseed -h $HOSTNAME -n $NAMESERVER -m $MAIL &
disown

tail -f --retry /opt/dnsseeder/dnsseeder.log