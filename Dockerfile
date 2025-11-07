#
# NOTE: THIS DOCKERFILE IS GENERATED VIA "apply-templates.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#

FROM ghcr.io/viggle-by/ubuntufanmade:main

# Avoid interactive prompts during install
ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
    apt-get update; \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        gnupg \
        netbase \
        wget \
        tzdata \
    ; \
    # Configure tzdata to avoid prompts
    ln -fs /usr/share/zoneinfo/Etc/UTC /etc/localtime; \
    dpkg-reconfigure --frontend noninteractive tzdata; \
    # Clean up
    apt-get clean; \
    rm -rf /var/lib/apt/lists/*
