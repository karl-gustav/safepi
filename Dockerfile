FROM node:22-slim

RUN apt-get update && apt-get install -y \
    docker.io \
    git \
    curl \
    python3 \
    golang-go \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

RUN npm install --cache "" -g --ignore-scripts @earendil-works/pi-coding-agent@latest
RUN pi install npm:@lpirito/pi-diffloop

RUN useradd --create-home --shell /bin/bash piuser \
    && mkdir -p /workspace /home/piuser/.pi \
    && chown -R piuser:piuser /workspace /home/piuser/.pi

WORKDIR /workspace

USER piuser
ENV HOME=/home/piuser

ENTRYPOINT ["pi"]
