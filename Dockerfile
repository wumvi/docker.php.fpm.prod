FROM wumvi/php.base:7.1
MAINTAINER Vitaliy Kozlenko <vk@wumvi.com>

LABEL version="1.0" php="7.1" mode="prod"

ENV RUN_MODE PROD

RUN DEBIAN_FRONTEND=noninteractive && \
    apt-get update && \
    apt-get install --no-install-recommends -qq -y php${PHP_VERSION}-fpm && \
    apt-get install -y libfcgi0ldbl && \
    #
    mkdir -p /var/run/php && \
    chown www-data:www-data /var/run/php && \
    #
	apt-get -y autoremove && \
	apt-get -y clean && \
    rm -rf /var/lib/apt/lists/* && \
    echo 'end'

EXPOSE 9000

ADD www.conf /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

HEALTHCHECK --interval=10s --timeout=5s \
        CMD REDIRECT_STATUS=true SCRIPT_NAME=/ping SCRIPT_FILENAME=/ping REQUEST_METHOD=GET cgi-fcgi -bind -connect /var/run/php/php7.1-fpm.sock

CMD ["/usr/sbin/php-fpm7.1", "-c", "/etc/php/7.1/fpm/php.ini", "-y", "/etc/php/7.1/fpm/php-fpm.conf", "-F"]
