nest g res api/otel-test
nest g res api/metrics
nest g module winston
nest g provider winston



docker build . -t monitoring-test:latest --rm


