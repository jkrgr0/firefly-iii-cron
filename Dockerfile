FROM alpine:3.21.3

RUN apk add --no-cache curl dumb-init

COPY --chmod=500 ./start.sh /start.sh

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

CMD ["/start.sh"]