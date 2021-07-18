**Pi-Hole & Cloudflared DoH (DNS-over-HTTPS) Docker**
=============

Forked from [AzamServer](https://github.com/AzamServer/pihole-doh). Modifications include de-fanging to make this DNS only and not take over DHCP.

Instead of pulling from Docker, must be built locally to be run.

```sh
docker build -t local-pihole-doh:latest .
docker-compose up -d
```

### License

See the original repository or the `LICENSE` file for license information.
