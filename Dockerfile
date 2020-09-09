FROM testdasi/pihole-base-buster-plus:latest-amd64

# add cloudflared config
ADD cloudflared /tmp

COPY ./install.sh /
RUN /bin/bash /install.sh \
    && rm -f /install.sh
