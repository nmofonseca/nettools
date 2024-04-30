# syntax=docker/dockerfile:1

FROM debian:stable-slim

RUN <<EOF 
    apt-get update
    apt upgrade -y
    apt-get install -y \
    curl \
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
    redis-tools
    rm -rf /var/lib/apt/lists/* 
    apt-get clean
    useradd -ms /bin/bash nettools
EOF

USER nettools

CMD ["/bin/bash"]