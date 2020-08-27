# pihole-with-DoH
Official pihole docker with Cloudflared DoH client to enable DNS-over-HTTPS. Use Cloudflare DoH service by default.

### Notes:
* Remember to set pihole env DNS1 and DNS2 to use 127.1.1.1#5053 (refer to official docker parameters below).
* You can edit /etc/cloudflared/config.yml to add more services. I have experienced some connection issues with other services (including google) so have decided to leave them out. Nano is included for your convenience ;)
* For docker parameters, refer to [official pihole docker readme](https://github.com/pi-hole/pi-hole)
* Cloudflared client was obtained from [official site](https://developers.cloudflare.com/argo-tunnel/downloads)

