#!/bin/sh
IPREX4='([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])\.([0-9]{1,2}|1[0-9][0-9]|2[0-4][0-9]|25[0-5])'
cd /data || exit
if [ -z "$DNS" ]; then
    echo "DNS not set, use default DNS."
else
    echo "Apply DNS: ""$DNS"
    echo "$DNS" | sed 's/"//g' | grep -Eo "[^,]+" | grep -Eo "$IPREX4" | sed "s/^/nameserver /g" >/etc/resolv.conf
fi
ls -shan /data
sed 's/\r$//' /data/caddyfile.txt >/tmp/caddyfile
exec caddy run --config /tmp/caddyfile --adapter caddyfile
