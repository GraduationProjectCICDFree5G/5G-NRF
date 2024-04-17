FROM 5ggraduationproject/free5gc-base AS builder
FROM alpine:3.13.6

LABEL maintainer="raoufkh <khichane.araouf@gmail.com>"

ENV GIN_MODE="release"

WORKDIR /free5gc
RUN mkdir -p log/ cert/ nrf/

# Copy executable and default certs
COPY --from=builder /free5gc/nrf ./nrf
COPY --from=builder /free5gc/cert/nrf.pem ./cert/
COPY --from=builder /free5gc/cert/nrf.key ./cert/

VOLUME [ "/free5gc/config" ]
#VOLUME [ "/free5gc/config/TLS" ]

WORKDIR /free5gc/nrf
