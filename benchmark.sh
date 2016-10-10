#!/bin/bash

set -o pipefail
set -e
set -u


ARC=/work/linux-4.8.1.tar
BRO=/work/brotli/bin/bro
ZSTD=/work/zstd/zstd

xz -cd ${ARC}.xz > ${ARC}

set -x

time cat ${ARC} | gzip    > kernel.gz
time cat ${ARC} | ${ZSTD} > kernel.zstd
for q in {0..5}; do
    time cat ${ARC} | ${BRO} --quality ${q} > kernel.bro${q}
done

ls -lh /work/linux* /work/kernel*

time cat kernel.gz | gunzip >/dev/null
time cat kernel.zstd | ${ZSTD} -d >/dev/null
for q in {0..5}; do
    time cat kernel.bro${q} | ${BRO} --decompress >/dev/null
done

