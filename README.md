You can build deno with this Dockerfile.

```console
$ docker build . -t centos-deno
Sending build context to Docker daemon  59.39kB
Step 1/12 : FROM centos:centos7
 ---> 9f38484d220f
Step 2/12 : RUN yum install -y git
 ---> Using cache
 ---> c920dfb43bb3
Step 3/12 : RUN git clone --recurse-submodules https://github.com/denoland/deno.git
 ---> Using cache
 ---> 5d43c6196531
Step 4/12 : RUN curl -sSf https://sh.rustup.rs | sh -s -- -y
 ---> Using cache
 ---> 562faf5fab7b
Step 5/12 : ENV PATH=${PATH}:/root/.cargo/bin
 ---> Using cache
 ---> 3aca5cde58eb
Step 6/12 : RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
 ---> Using cache
 ---> 5bc38976d3ed
Step 7/12 : RUN yum install -y nodejs
 ---> Using cache
 ---> e1b777355eac
Step 8/12 : WORKDIR deno
 ---> Using cache
 ---> 6367a6959ec3
Step 9/12 : RUN sed -i '20i use_sysroot = false' .gn
 ---> Using cache
 ---> 45df2001b2b4
Step 10/12 : RUN ./tools/setup.py
 ---> Using cache
 ---> 2cbe969c455e
Step 11/12 : RUN yum install -y gcc
 ---> Using cache
 ---> a9d202d99ae0
Step 12/12 : RUN ./tools/build.py --release
 ---> Using cache
 ---> ff562ed3288c
Successfully built ff562ed3288c
Successfully tagged centos-deno:latest
$ docker run --rm centos-deno /deno/target/release/deno version
deno: 0.5.0
v8: 7.6.53
typescript: 3.4.1
```
