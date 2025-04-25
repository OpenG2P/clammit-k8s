FROM golang:alpine AS builder

RUN apk add --no-cache git ca-certificates make cmake

ARG CGO_ENABLED=0

ADD clammit /clammit
RUN cd /clammit && make all

FROM alpine:3.21.3

ARG container_user=clam
ARG container_user_group=clam
ARG container_user_uid=1001
ARG container_user_gid=1001

RUN apk --no-cache add ca-certificates bash gettext curl

RUN addgroup -S -g ${container_user_gid} ${container_user_group} && \
    adduser -SH -s /bin/bash -G ${container_user_group} -u ${container_user_uid} ${container_user}

COPY --from=builder /go/bin/clammit /bin/clammit

ADD docker-entrypoint.sh /
RUN mkdir /etc/clammit && \
    chown -R ${container_user}:${container_user_group} /etc/clammit
ADD --chown=${container_user}:${container_user_group} clammit.cfg.tpl /etc/clammit

USER ${container_user}

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["clammit", "-config", "/etc/clammit/clammit.cfg"]
