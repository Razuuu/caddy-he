ARG VERSION=2.11.4

FROM caddy:${VERSION}-builder-alpine AS builder
ARG VERSION

RUN --mount=type=cache,target=/root/.cache/go-build xcaddy build v${VERSION} --with github.com/caddy-dns/he@main

FROM caddy:${VERSION}-alpine
ARG VERSION

COPY --from=builder /usr/bin/caddy /usr/bin/caddy
