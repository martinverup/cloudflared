FROM alpine:latest

ENV PORT 5053

ADD Dockerfile .

RUN apk add --no-cache ca-certificates libc6-compat libstdc++ && \
    wget -O- https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.tgz | tar xzC /usr/local/bin

EXPOSE $PORT/tcp $PORT/udp

ENTRYPOINT /usr/local/bin/cloudflared proxy-dns --port $PORT --address 0.0.0.0 --upstream https://1.1.1.1/dns-query --upstream https://1.0.0.1/dns-query
