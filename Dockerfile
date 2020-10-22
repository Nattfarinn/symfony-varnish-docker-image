FROM varnish:latest

ENV WEBSERVER_HOST=webserver
ENV WEBSERVER_PORT=80

COPY varnish.template /etc/varnish/varnish.template

CMD ["/bin/sh", "-c", "envsubst '${WEBSERVER_HOST},${WEBSERVER_PORT}' < /etc/varnish/varnish.template > /etc/varnish/varnish.vcl && docker-varnish-entrypoint"]
