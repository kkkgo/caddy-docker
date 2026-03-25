FROM alpine:edge AS builder
RUN apk upgrade&&apk add go git
WORKDIR /data
RUN git clone https://github.com/caddyserver/xcaddy.git --depth 1 
WORKDIR /data/xcaddy/cmd/xcaddy
RUN go run main.go build latest \
--with github.com/caddy-dns/cloudflare \
--with github.com/caddy-dns/dnspod \
--with github.com/caddy-dns/tencentcloud \
--with github.com/caddy-dns/alidns \
--with github.com/caddy-dns/acmedns \
--with github.com/caddy-dns/godaddy \
--with github.com/caddy-dns/digitalocean \
--with github.com/caddy-dns/duckdns \
--with github.com/caddy-dns/namecheap \
--with github.com/caddy-dns/dynv6 \
--with github.com/caddy-dns/route53
RUN /data/xcaddy/cmd/xcaddy/caddy -v

FROM alpine:edge
COPY --from=builder /data/xcaddy/cmd/xcaddy/caddy /usr/bin/
RUN apk update && \
    apk upgrade && \
    apk add --no-cache tzdata ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/*
WORKDIR /data
ENV TZ=Asia/Shanghai \
    DNS=""
COPY init.sh /
CMD sh /init.sh
