ARG BASE_IMAGE=library/debian:stable-slim

FROM docker.io/${BASE_IMAGE}

RUN <<-EOT sh
	set -eu

	apt-get update
	env DEBIAN_FRONTEND=noninteractive \
		apt-get install -y --no-install-recommends tor curl \
		-o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold"
	apt-get clean && rm -rf /var/lib/apt/lists/* /var/lib/apt/lists/*
EOT

COPY rootfs /

EXPOSE 9050/tcp

HEALTHCHECK --interval=5m --timeout=5s \
  CMD timeout 2 curl -sfo /dev/null --socks5-hostname 127.0.0.1:9050 'http://check.torproject.org'

USER debian-tor

ENTRYPOINT ["/usr/sbin/tor"]
CMD ["-f", "/etc/tor/torrc"]
