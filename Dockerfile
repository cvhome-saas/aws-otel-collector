# Use the official AWS Distro for OpenTelemetry Collector image
FROM otel/opentelemetry-collector-contrib:0.139.0

# Set working directory
WORKDIR /etc/otel-config

# Copy your OpenTelemetry configuration file into the container
COPY otel-config.yaml /etc/otel-config/otel-config.yaml

# Expose the OTLP ports for gRPC (4317) and HTTP (4318)
EXPOSE 4317 
EXPOSE 4318

ENTRYPOINT ["/otelcol-contrib"]
CMD ["--config", "/etc/otel-config/otel-config.yaml"]