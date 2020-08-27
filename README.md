# pihole-with-DoH
Official pihole docker with cloudflared DoH client. Use Cloudflare DoH service by default.

### Notes:
* You can edit /etc/cloudflared/config.yml to add more services. I have experienced some connection issues with other services (including google) so have decided to leave them out.
* For docker parameters, refer to [official pihole docker readme](https://github.com/pi-hole/pi-hole)
* Cloudflared client can be downloaded from [official site](https://developers.cloudflare.com/argo-tunnel/downloads)
* For simpler installation, a version of cloudflared binary is included i.e. instead of "wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb" every time.

