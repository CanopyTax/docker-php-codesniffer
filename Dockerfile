FROM dylanlindgren/docker-phpcli:latest

MAINTAINER "Skyler Lewis" <sblnog@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y wget && \
    wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    chmod +x phpcs.phar && \
    mv phpcs.phar /usr/local/bin/phpcs && \
    wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && \
    chmod +x phpcbf.phar && \
    mv phpcbf.phar /usr/local/bin/phpcbf && \
    apt-get remove -y wget

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["phpcs"]
