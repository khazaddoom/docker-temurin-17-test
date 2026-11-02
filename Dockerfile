# Use Java 17 on the Ubuntu 24.04 (Noble) baseline
FROM eclipse-temurin:17-jre-noble

# Temporarily switch to root to install the live upstream security patches
USER root

# This guarantees the scanner sees the exact fixed versions from the Ubuntu security feeds
RUN apt-get update && \
    apt-get install -y --only-upgrade libssl3t64 libbrotli1 openssl && \
    rm -rf /var/lib/apt/lists/*

# Switch back to the standard non-root user (Temurin default)
USER 1000