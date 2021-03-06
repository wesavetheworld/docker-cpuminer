FROM            ubuntu:14.04
LABEL           Guillaume J. Charmes <guillaume@charmes.net>

RUN             apt-get update -qq && \
                apt-get install -qqy automake libcurl4-openssl-dev git make

RUN             git clone https://github.com/pooler/cpuminer

RUN             cd cpuminer && \
                ./autogen.sh && \
                ./configure CFLAGS="-O3" && \
                make

WORKDIR         /cpuminer
ENTRYPOINT      ["./minerd"]
