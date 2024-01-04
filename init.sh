#!/bin/sh
cd /data || exit
if [ -z "$DNS" ]; then
    echo "DNS not set, use default DNS."
else
    echo "Apply DNS: ""$DNS"
    echo "$DNS" | grep -Eo "[^,]+" | sed "s/^/nameserver /g" >/etc/resolv.conf
fi
caddy run --config caddyfile --adapter caddyfile
