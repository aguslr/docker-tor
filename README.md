[aguslr/docker-tor][1]
======================

[![docker-pulls](https://img.shields.io/docker/pulls/aguslr/tor)](https://hub.docker.com/r/aguslr/tor) [![image-size](https://img.shields.io/docker/image-size/aguslr/tor/latest)](https://hub.docker.com/r/aguslr/tor)


This *Docker* image sets up *Tor* to be used as a SOCKS proxy that can redirect
traffic through the *Tor* network.

> **[Tor][2]** is a free and open-source software for enabling anonymous
> communication by directing Internet traffic through a free, worldwide,
> volunteer overlay network to conceal a user's location and usage from anyone
> performing network surveillance or traffic analysis.


Installation
------------

To use *Tor* for improved privacy, follow these steps:

1. Clone and start the container:

       docker run -p 9050:9050 docker.io/aguslr/tor:latest

2. Change your [Web browser's proxy settings][3] to point to the appropriate
   proxy:
    - All traffic through *Tor*: use *SOCKSv5* proxy with `127.0.0.1:9050`.

Using a *SOCKSv5* proxy is preferred as it provides added security.


Build locally
-------------

Instead of pulling the image from a remote repository, you can build it locally:

1. Clone the repository:

       git clone https://github.com/aguslr/docker-tor.git

2. Change into the newly created directory and use `docker-compose` to build and
   launch the container:

       cd docker-tor && docker-compose up --build -d


[1]: https://github.com/aguslr/docker-tor
[2]: https://torproject.org/
[3]: https://web.archive.org/web/https://www.stupidproxy.com/how-to-use-proxy/
