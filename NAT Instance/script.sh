#!/bin/sh

bin_location=/usr/local/bin
# bin_location=a

nat_setup_url=https://raw.githubusercontent.com/agarwalvaibhav0211/aws_scripts/main/NAT%20Instance/libs/nat-setup.sh
nat_service_url=https://raw.githubusercontent.com/agarwalvaibhav0211/aws_scripts/main/NAT%20Instance/libs/nat.service


mkfile() { mkdir -p "$(dirname "$1")" && touch "$1" ;  }


mkfile  ${bin_location}/nat-setup
curl $nat_setup_url -o ${bin_location}/nat-setup


mkfile /etc/systemd/system/nat.service
curl $nat_service_url -o /etc/systemd/system/nat.service


systemctl daemon-reload
systemctl start nat.service
systemctl enable nat.service

echo "Service nat.service created"

