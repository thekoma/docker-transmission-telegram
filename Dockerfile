FROM golang:alpine AS builder
LABEL maintainer="Andrea Cervesato <andrea.cervesato@gmail.com>"
RUN apk add --update git
ENV GO111MODULE=on CGO_ENABLED=0 BRANCH=@master
RUN go install github.com/pyed/transmission-telegram${BRANCH}

FROM alpine:latest
LABEL maintainer="Andrea Cervesato <andrea.cervesato@gmail.com>"
COPY --from=builder /go/bin/transmission-telegram /bin/transmission-telegram
COPY entrypoint.sh /entrypoint.sh
RUN apk --update-cache add curl ca-certificates bash dumb-init
RUN chmod +x /bin/transmission-telegram /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
