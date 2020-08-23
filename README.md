# pihole-with-DoH
Official pihole docker with cloudflared DoH client. Use Cloudflare and Google DoH services.

### Notes:
* I decided to exclude 9.9.9.9 because it does additional blocking which duplicates the purpose of pihole.
* For docker parameters, refer to [official pihole docker readme](https://github.com/pi-hole/pi-hole)
* Cloudflared client can be downloaded from [official site](https://developers.cloudflare.com/argo-tunnel/downloads)
* For simpler installation, a version of cloudflared is included i.e. instead of "wget https://bin.equinox.io/c/VdrWdbjqyF/cloudflared-stable-linux-amd64.deb"

