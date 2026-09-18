FROM node:20-slim

# Install essential system tools the agent needs to run code
RUN apt-get update && apt-get install -y \
    docker.io \
    git \
    curl \
    python3 \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Securely install the Pi coding agent globally
RUN npm install -g --ignore-scripts @earendil-works/pi-coding-agent
RUN pi install npm:@lpirito/pi-diffloop

# Create an unprivileged user for running the agent
RUN useradd --create-home --shell /bin/bash piuser \
    && mkdir -p /workspace /home/piuser/.pi \
    && chown -R piuser:piuser /workspace /home/piuser/.pi

WORKDIR /workspace

USER piuser
ENV HOME=/home/piuser

ENTRYPOINT ["pi"]
