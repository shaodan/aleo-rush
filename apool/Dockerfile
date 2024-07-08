FROM ubuntu:22.04 as builder

ENV APOOL_MINER_VERSION=1.6.7

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://github.com/apool-io/apoolminer/releases/download/v${APOOL_MINER_VERSION}/apoolminer_linux_v${APOOL_MINER_VERSION}.tar -O apoolminer.tar \
    && tar xvf apoolminer.tar

FROM ubuntu:22.04

COPY --from=builder apoolminer /app/runner
COPY run.sh /app/run.sh

WORKDIR /app

ENTRYPOINT ["/app/run.sh"]
