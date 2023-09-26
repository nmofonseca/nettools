FROM debian:stable-slim

RUN apt-get update && apt-get install -y \
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
    && rm -rf /var/lib/apt/lists/* \
    && apt-get clean

RUN useradd -ms /bin/bash nettools

USER nettools

CMD ["/bin/bash"]