FROM python:3
WORKDIR /app
RUN apt update && apt install -y make gcc git  \
        && git clone https://github.com/rofl0r/proxychains-ng.git \
        && cd proxychains-ng/ \
        && ./configure --prefix=/usr --sysconfdir=/etc \
        && make \
        && make install \
        && make install-config
COPY . /app
RUN chmod +x /app/docker-entrypoint.sh

ENTRYPOINT ["/app/docker-entrypoint.sh"]
CMD ["--help"]
