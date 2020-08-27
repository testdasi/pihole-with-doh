FROM testdasi/pihole-base-buster:latest

# add cloudflared binary and config
ADD cloudflared /tmp

# install cloudflared
RUN cd /tmp \
    && mkdir -p /etc/cloudflared \
    && cp -n ./config.yml /etc/cloudflared/ \
    && rm -f ./config.yml \
    && apt install ./cloudflared-stable-linux-amd64.deb \
    && rm -f ./cloudflared-stable-linux-amd64.deb \
    && useradd -s /usr/sbin/nologin -r -M cloudflared \
    && chown cloudflared:cloudflared /usr/local/bin/cloudflared

# run cloudflared as service
RUN mkdir -p /etc/services.d/cloudflared \
    && echo '#!/usr/bin/with-contenv bash' > /etc/services.d/cloudflared/run \
    && echo 's6-echo "Starting cloudflared"' >> /etc/services.d/cloudflared/run \
    && echo '/usr/local/bin/cloudflared --config /etc/cloudflared/config.yml' >> /etc/services.d/cloudflared/run \
    && echo '#!/usr/bin/with-contenv bash' > /etc/services.d/cloudflared/finish \
    && echo 's6-echo "Stopping cloudflared"' >> /etc/services.d/cloudflared/finish \
    && echo 'killall -9 cloudflared' >> /etc/services.d/cloudflared/finish
