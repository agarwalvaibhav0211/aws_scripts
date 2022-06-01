metadata="http://169.254.169.254/latest/meta-data"
mac=$(curl -s $metadata/network/interfaces/macs/ | head -n1 | tr -d '/')
cidr=$(curl -s $metadata/network/interfaces/macs/$mac/vpc-ipv4-cidr-block/)
echo 1 > /proc/sys/net/ipv4/ip_forward
iptables -t nat -A POSTROUTING -s $cidr -j MASQUERADE