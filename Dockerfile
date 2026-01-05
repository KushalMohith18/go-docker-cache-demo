# syntax=docker/dockerfile:1.4

FROM golang:1.21-alpine AS builder
WORKDIR /src

# Copy dependency files
COPY go.mod go.sum ./

# Module cache (GHA-backed)
RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

# Copy source code
COPY app ./app

# 🔍 DEBUG: show Go build cache size (proof of reuse)
RUN --mount=type=cache,target=/root/.cache/go-build \
    bash -c "du -sh /root/.cache/go-build || true"

# Build with compiler cache
RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -o app ./app

# ----------------------------

FROM alpine:latest
WORKDIR /app
COPY --from=builder /src/app .

EXPOSE 8080
CMD ["./app"]
