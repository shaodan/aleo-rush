FROM ubuntu:22.04 as builder

ENV F2POOL_MINER_VERSION=2.8.4

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget unzip \
    && rm -rf /var/lib/apt/lists/*

RUN wget --no-check-certificate https://public-download-ase1.s3.ap-southeast-1.amazonaws.com/aleo-miner/Aleo+miner+${F2POOL_MINER_VERSION}.zip -O f2poolminer.zip \
    && unzip f2poolminer.zip && chmod +x aleo-miner
    
FROM ubuntu:22.04

COPY --from=builder aleo-miner /app/runner
COPY run.sh /app/run.sh

WORKDIR /app

ENTRYPOINT ["/app/run.sh"]
