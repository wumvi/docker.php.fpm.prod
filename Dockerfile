FROM wumvi/php.base
MAINTAINER Vitaliy Kozlenko <vk@wumvi.com>

LABEL version="1.0" php="7.2" mode="prod"

ENV PHP_VERSION 7.2
ENV RUN_MODE PROD

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -qq -y php$PHP_VERSION-fpm && \
	apt-get -y autoremove && \
	apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
	rm -rf /soft/

EXPOSE 9000
