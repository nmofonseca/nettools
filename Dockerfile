# syntax=docker/dockerfile:1

FROM debian:stable-slim

RUN apt-get update && apt upgrade -y && apt-get install -y  curl \
        dnsutils \
        iproute2 \
        iputils-ping \
        net-tools \
        nmap \
        tcpdump \
        traceroute \
        mtr \
        iperf3 \
        netcat-openbsd \
        apache2-utils \
        telnet \
        redis-tools \
        liburi-perl \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean \
    && useradd -ms /bin/bash nettools

ADD --chmod=755 https://raw.githubusercontent.com/memcached/memcached/master/scripts/memcached-tool /usr/local/bin/memcached-tool

USER nettools

CMD ["/bin/bash"]