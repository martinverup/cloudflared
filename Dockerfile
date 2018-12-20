FROM alpine:latest

RUN apk add --no-cache ca-certificates libc6-compat libstdc++ && \
    wget -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz | tar xzC /usr/local/bin

ENTRYPOINT /usr/local/bin/cloudflared proxy-dns --port 5053 --address 0.0.0.0 --upstream https://1.1.1.1/dns-query --upstream https://1.0.0.1/dns-query
