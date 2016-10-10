[gzip, zstd, brotliの比較記事](https://gist.github.com/ymmt2005/89f27b040796248e8133d1f076ab9536)を真似して [facebook/zstd](https://github.com/facebook/zstd) と [google/brotli](https://github.com/google/brotli) を比較


## 使い方

1. docker をインストール
2. git clone https://github.com/mapk0y/docker-compare-compression
3. cd docker-compare-compression
4. docker build -t compare-compression ./
5. docker run --rm compare-compression

## 手元での結果

- CPU: Intel Core i5-5250U 1.6GHz*4(2core, HT)
- Memory: 16GB
- Disk: Crucial_CT500MX200SSD4


```
$ docker run --rm compare-compression
+ cat /work/linux-4.8.1.tar
+ gzip

real    0m23.808s
user    0m23.560s
sys     0m0.732s
+ cat /work/linux-4.8.1.tar
+ /work/zstd/zstd

real    0m4.976s
user    0m4.620s
sys     0m0.604s
+ for q in '{0..5}'
+ cat /work/linux-4.8.1.tar
+ /work/brotli/bin/bro --quality 0

real    0m3.850s
user    0m3.652s
sys     0m0.504s
+ for q in '{0..5}'
+ cat /work/linux-4.8.1.tar
+ /work/brotli/bin/bro --quality 1

real    0m4.370s
user    0m4.124s
sys     0m0.576s
+ for q in '{0..5}'
+ cat /work/linux-4.8.1.tar
+ /work/brotli/bin/bro --quality 2

real    0m6.714s
user    0m6.500s
sys     0m0.640s
+ for q in '{0..5}'
+ cat /work/linux-4.8.1.tar
+ /work/brotli/bin/bro --quality 3

real    0m7.922s
user    0m7.696s
sys     0m0.652s
+ for q in '{0..5}'
+ cat /work/linux-4.8.1.tar
+ /work/brotli/bin/bro --quality 4

real    0m10.970s
user    0m10.632s
sys     0m0.732s
+ for q in '{0..5}'
+ cat /work/linux-4.8.1.tar
+ /work/brotli/bin/bro --quality 5

real    0m20.528s
user    0m20.160s
sys     0m0.776s

+ ls -lh /work/linux-4.8.1.tar /work/linux-4.8.1.tar.xz /work/kernel.bro0 /work/kernel.bro1 /work/kernel.bro2 /work/kernel.bro3 /work/kernel.bro4 /work/kernel.bro5 /work/kernel.gz /work/kernel.zstd
-rw-r--r-- 1 root root 176M Oct 10 00:15 /work/kernel.bro0
-rw-r--r-- 1 root root 169M Oct 10 00:15 /work/kernel.bro1
-rw-r--r-- 1 root root 133M Oct 10 00:15 /work/kernel.bro2
-rw-r--r-- 1 root root 129M Oct 10 00:15 /work/kernel.bro3
-rw-r--r-- 1 root root 124M Oct 10 00:15 /work/kernel.bro4
-rw-r--r-- 1 root root 113M Oct 10 00:16 /work/kernel.bro5
-rw-r--r-- 1 root root 135M Oct 10 00:15 /work/kernel.gz
-rw-r--r-- 1 root root 132M Oct 10 00:15 /work/kernel.zstd
-rw-r--r-- 1 root root 656M Oct 10 00:14 /work/linux-4.8.1.tar
-rw-r--r-- 1 root root  88M Oct  9 22:29 /work/linux-4.8.1.tar.xz
+ cat kernel.gz
+ gunzip

real    0m4.180s
user    0m4.164s
sys     0m0.100s
+ cat kernel.zstd
+ /work/zstd/zstd -d

real    0m1.299s
user    0m1.276s
sys     0m0.084s
+ for q in '{0..5}'
+ cat kernel.bro0
+ /work/brotli/bin/bro --decompress
real    0m2.172s
user    0m2.156s
sys     0m0.100s
+ for q in '{0..5}'
+ cat kernel.bro1
+ /work/brotli/bin/bro --decompress

real    0m2.105s
user    0m2.068s
sys     0m0.148s
+ for q in '{0..5}'
+ cat kernel.bro2
+ /work/brotli/bin/bro --decompress

real    0m1.692s
user    0m1.672s
sys     0m0.084s
+ for q in '{0..5}'
+ cat kernel.bro3
+ /work/brotli/bin/bro --decompress

real    0m1.611s
user    0m1.584s
sys     0m0.092s
+ for q in '{0..5}'
+ cat kernel.bro4
+ /work/brotli/bin/bro --decompress
real    0m1.542s
user    0m1.512s
sys     0m0.096s
+ for q in '{0..5}'
+ cat kernel.bro5
+ /work/brotli/bin/bro --decompress

real    0m1.458s
user    0m1.428s
sys     0m0.100s
```

※ brotli のデフォルト（-q11）での圧縮は時間がかかりすぎる（25分ぐらい）
