#!/bin/bash
php /usr/bin/cachetool.phar opcache:status --fcgi=/run/php/php7.2-fpm.sock
exit $@