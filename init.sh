#!/bin/sh
cd /data || exit
if [ -z "$DNS" ]; then
    echo "DNS not set, use default DNS."
else
    echo "Apply DNS: ""$DNS"
    echo "$DNS" | sed 's/"//g' | grep -Eo "[^,]+" | sed "s/^/nameserver /g" >/etc/resolv.conf
fi
sed 's/\r$//' /data/caddyfile.txt >/tmp/caddyfile
caddy run --config /tmp/caddyfile --adapter caddyfile
