FROM debian:bookworm-slim AS lister
RUN apt-get update && apt-get install -y zlib1g

# Stage 2: Final Image
FROM gcr.io/distroless/base-debian12
# Copy the binary
COPY target/ping-service /app/ping-service
# Copy the missing library from the lister stage
COPY --from=lister /lib/x86_64-linux-gnu/libz.so.1 /lib/x86_64-linux-gnu/libz.so.1

WORKDIR /app
ENTRYPOINT ["/app/ping-service"]