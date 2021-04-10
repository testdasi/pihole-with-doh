FROM testdasi/pihole-base-buster-plus:latest

# add cloudflared config
ADD cloudflared /tmp

COPY ./install.sh /
RUN /bin/bash /install.sh \
    && rm -f /install.sh
