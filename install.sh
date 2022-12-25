#!/bin/bash

# add cloudflared config
cd /tmp \
    && mkdir -p /etc/cloudflared \
    && cp -n ./config.yml /etc/cloudflared/ \
    && rm -f ./config.yml

## Piggy-backing on Pihole service ##
# Insert run lines below the call capsh comment
sed -i "/^# Call capsh with the detected capabilities/a start-stop-daemon --start --background --name cloudflared --chdir \/config --exec \/usr\/local\/bin\/cloudflared -- --config \/etc\/cloudflared\/config.yml" /etc/s6-overlay/s6-rc.d/pihole-FTL/run
# Insert finish lines above kill pihole
sed -i "/^killall -15 pihole-FTL/i killall -15 cloudflared" /etc/s6-overlay/s6-rc.d/pihole-FTL/finish
