FROM python:3.9.16-alpine3.17
ENV HOME=/srv
WORKDIR /srv

RUN apk add --no-cache kubectl --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing/ && \
    pip --no-cache-dir --disable-pip-version-check --quiet install awscli

# Copy entrypoint.sh
COPY entrypoint.sh .
COPY handlers .

# Set permissions on the file.
RUN chmod +x entrypoint.sh

USER nobody

CMD ["/srv/entrypoint.sh"]
