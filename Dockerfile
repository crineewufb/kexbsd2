FROM alpine:edge

ARG AUUID="8308987b-0519-4bd0-aa1e-d5d0df0d026d"
ARG CADDYIndexPage="https://github.com/technext/game-warrior/archive/refs/heads/master.zip"
ARG ParameterSSENCYPT="chacha20-ietf-poly1305"
ARG PORT=80

ADD etc/Caddyfile /tmp/Caddyfile
ADD etc/xray.json /tmp/xray.json
ADD deploy.sh /deploy.sh
ADD start.sh /start.sh

RUN apk update && \
    apk add --no-cache ca-certificates bash caddy tor unzip wget && \
    bash deploy.sh

RUN chmod +x /start.sh

CMD /start.sh
