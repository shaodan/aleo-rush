FROM ubuntu:22.04 as builder


RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://github.com/apool-io/apoolminer/releases/download/v1.6.4/apoolminer_linux_v1.6.4.tar \
    && tar xvf apoolminer_linux_v1.6.4.tar 
    
FROM ubuntu:22.04

COPY --from=builder apoolminer /app/runner
COPY run.sh /app/run.sh

WORKDIR /app

ENTRYPOINT ["/app/run.sh"]


