FROM php:7.2-alpine

RUN apk add --no-cache tini

COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN composer global require --prefer-dist --no-progress --dev squizlabs/php_codesniffer dealerdirect/phpcodesniffer-composer-installer phpcompatibility/phpcompatibility-wp wp-coding-standards/wpcs
ENV PATH /root/.composer/vendor/bin:${PATH}

COPY ./docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

WORKDIR "/app"
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["phpcs"]
