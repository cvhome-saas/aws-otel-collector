# Use the official AWS Distro for OpenTelemetry Collector image
FROM public.ecr.aws/aws-observability/aws-otel-collector:latest

# Set working directory
WORKDIR /etc/otel-config

# Copy your OpenTelemetry configuration file into the container
COPY otel-config.yaml /etc/otel-config/otel-config.yaml

# Expose the OTLP ports for gRPC (4317) and HTTP (4318)
EXPOSE 4317 4318

# Run the collector with the copied config
ENTRYPOINT ["/awscollector"]
CMD ["--config", "/etc/otel-config/otel-config.yaml"]
