ARG BASE_IMAGE=library/alpine:latest

FROM docker.io/${BASE_IMAGE}

RUN \
  apk add --update --no-cache tor curl \
  && rm -rf /var/cache/apk/*

COPY torrc /etc/tor/torrc

EXPOSE 9050/tcp

HEALTHCHECK --interval=5m --timeout=5s \
  CMD timeout 2 curl -sfo /dev/null --socks5-hostname 127.0.0.1:9050 'https://check.torproject.org'

USER tor

ENTRYPOINT ["/usr/bin/tor"]
CMD ["-f", "/etc/tor/torrc"]
