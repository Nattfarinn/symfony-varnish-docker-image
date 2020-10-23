FROM varnish:latest

ENV WEBSERVER_HOST=webserver
ENV WEBSERVER_PORT=80

RUN apt-get update \
    && apt-get install -y --no-install-recommends gettext-base \
    && apt-get purge -y --auto-remove

COPY varnish.template /etc/varnish.template

CMD ["/bin/sh", "-c", "envsubst '${WEBSERVER_HOST},${WEBSERVER_PORT}' < /etc/varnish.template > /etc/varnish/default.vcl && docker-varnish-entrypoint"]
