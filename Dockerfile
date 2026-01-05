# syntax=docker/dockerfile:1.4

FROM golang:1.21-alpine AS builder
WORKDIR /src

# ✅ COPY BOTH FILES
COPY go.mod go.sum ./

# Module cache
RUN --mount=type=cache,target=/go/pkg/mod \
    go mod download

# Source code
COPY app ./app

# Build cache
RUN --mount=type=cache,target=/root/.cache/go-build \
    go build -o app ./app

FROM alpine:latest
WORKDIR /app
COPY --from=builder /src/app .

EXPOSE 8080
CMD ["./app"]
