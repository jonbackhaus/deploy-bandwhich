# ############################################################################ #
# This is the builder container
# ############################################################################ #
FROM rust:latest AS builder

WORKDIR /usr/local/bin/

# Install bandwhich
RUN cargo install bandwhich --root /usr/local/bin/

# ############################################################################ #
# This is the application container
# ############################################################################ #
FROM alpine AS application

WORKDIR /usr/local/bin

# Copy files from builder
COPY --from=builder /usr/local/bin/bandwhich ./bandwhich
