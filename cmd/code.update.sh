#!/bin/bash
php /usr/bin/cachetool.phar opcache:status --fcgi=/run/php/php7.1-fpm.sock
exit $@