FROM centos:centos7
ENV PATH=${PATH}:/root/.cargo/bin
RUN curl -sL https://rpm.nodesource.com/setup_10.x | bash -
RUN yum install -y git nodejs gcc
RUN curl -sSf https://sh.rustup.rs | sh -s -- -y
RUN git clone --recurse-submodules https://github.com/denoland/deno.git
WORKDIR deno
RUN sed -i '20i use_sysroot = false' .gn
RUN ./tools/setup.py
RUN ./tools/build.py --release
