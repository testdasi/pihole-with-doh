#!/bin/bash

# add cloudflared config
cd /tmp \
    && mkdir -p /etc/cloudflared \
    && cp -n ./config.yml /etc/cloudflared/ \
    && rm -f ./config.yml

# run cloudflared as service
mkdir -p /etc/services.d/cloudflared \
    && echo '#!/usr/bin/with-contenv bash' > /etc/services.d/cloudflared/run \
    && echo 's6-echo "Starting cloudflared"' >> /etc/services.d/cloudflared/run \
    && echo '/usr/local/bin/cloudflared --config /etc/cloudflared/config.yml' >> /etc/services.d/cloudflared/run \
    && echo '#!/usr/bin/with-contenv bash' > /etc/services.d/cloudflared/finish \
    && echo 's6-echo "Stopping cloudflared"' >> /etc/services.d/cloudflared/finish \
    && echo 'killall -9 cloudflared' >> /etc/services.d/cloudflared/finish
