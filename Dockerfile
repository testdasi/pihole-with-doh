ARG FRM='testdasi/pihole-base-buster-plus'
ARG TAG='latest'

FROM ${FRM}:${TAG}
ARG FRM
ARG TAG

# add cloudflared config
ADD cloudflared /tmp

COPY ./install.sh /
RUN /bin/bash /install.sh \
    && rm -f /install.sh

RUN echo "$(date "+%d.%m.%Y %T") Built from ${FRM} with tag ${TAG}" >> /build_date.info
