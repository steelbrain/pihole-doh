ARG PIHOLEVER=5.8.1
ARG CLOUDFLAREDVER=2021.7.0

FROM --platform linux/arm64 pihole/pihole:v${PIHOLEVER}-arm64-stretch

EXPOSE 53:53/tcp 53:53/udp 67:67/udp 80:80/tcp

RUN mkdir -p /etc/cloudflared/ \
    && curl -L https://github.com/cloudflare/cloudflared/releases/download/${CLOUDFLAREDVER}/cloudflared-linux-arm64 \
            -o /etc/cloudflared/cloudflared \
    && chmod +x /etc/cloudflared/cloudflared

COPY ./config.yml /etc/cloudflared/config.yml

COPY ./startup /etc/startup

RUN mkdir -p /etc/pihole-doh/logs/pihole \
    && chmod +x /etc/startup

ENTRYPOINT ["/etc/startup"]
