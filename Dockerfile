FROM centos:centos7

RUN yum install -y git

RUN git clone --recurse-submodules https://github.com/denoland/deno.git

RUN curl -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH=${PATH}:/root/.cargo/bin

RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y nodejs

WORKDIR deno

RUN sed -i '20i use_sysroot = false' .gn

RUN ./tools/setup.py

RUN yum install -y gcc

RUN ./tools/build.py --release
