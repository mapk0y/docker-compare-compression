FROM debian

WORKDIR /work
RUN set -ex \
        && apt-get update \
        && apt-get install -y --no-install-recommends \
            git \
            curl \
            ca-certificates \
            make \
            gcc \
            libc6-dev \
            xz-utils \
        && curl -sL -o linux-4.8.1.tar.xz https://cdn.kernel.org/pub/linux/kernel/v4.x/linux-4.8.1.tar.xz \
        && apt-get clean \
        && rm -rf /var/cache/apt

# install zstd
RUN set -ex \
        && git clone https://github.com/facebook/zstd.git \
        && cd zstd \
        && make

# setup brotli
RUN set -ex \
        && git clone https://github.com/google/brotli.git \
        && cd brotli \
        && make

COPY benchmark.sh /benchmark.sh
CMD ["/benchmark.sh"]
