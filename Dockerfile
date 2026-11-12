FROM golang:1-alpine

RUN apk add --no-cache \
    ca-certificates \
    bash \
    build-base \
    curl \
    git \
    nodejs \
    npm \
    ripgrep \
    python3

RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent@latest \
    && npm cache clean --force

RUN adduser -D -s /bin/bash piuser \
    && mkdir -p /workspace /home/piuser/.pi \
    && chown -R piuser:piuser /workspace /home/piuser/.pi

WORKDIR /workspace

USER piuser
ENV HOME=/home/piuser

RUN pi install npm:@lpirito/pi-diffloop
RUN pi install git:github.com/majorgilles/pi-grill-me

ENTRYPOINT ["pi"]
