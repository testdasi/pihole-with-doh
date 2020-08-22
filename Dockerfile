FROM pihole/pihole:latest

ADD cloudflared /tmp

RUN cd /tmp \
 	&& apt install ./cloudflared-stable-linux-amd64.deb \
    && useradd -s /usr/sbin/nologin -r -M cloudflared \
    && chown cloudflared:cloudflared /usr/local/bin/cloudflared \
    && mkdir -p /etc/services.d/cloudflared \
    && echo '#!/usr/bin/with-contenv bash' > /etc/services.d/cloudflared/run \
    && echo 's6-echo "Starting cloudflared"' >> /etc/services.d/cloudflared/run \
    && echo '/usr/local/bin/cloudflared proxy-dns --port 5053 --upstream https://1.1.1.1/dns-query --upstream https://1.0.0.1/dns-query' >> /etc/services.d/cloudflared/run \
    && echo '#!/usr/bin/with-contenv bash' > /etc/services.d/cloudflared/finish \
    && echo 's6-echo "Stopping cloudflared"' >> /etc/services.d/cloudflared/finish \
    && echo 'killall -9 cloudflared' >> /etc/services.d/cloudflared/finish
