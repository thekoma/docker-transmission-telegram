FROM golang:alpine AS builder
LABEL maintainer="Andrea Cervesato <andrea.cervesato@gmail.com>"
RUN apk add --update git
ENV GO111MODULE=on CGO_ENABLED=0 BRANCH=@master
RUN go get github.com/pyed/transmission-telegram${BRANCH}

FROM alpine:latest
LABEL maintainer="Andrea Cervesato <andrea.cervesato@gmail.com>"
COPY --from=builder /go/bin/transmission-telegram /bin/transmission-telegram
RUN chmod +x /bin/transmission-telegram
ENTRYPOINT [ "/bin/transmission-telegram", "-token=${TELEGRAM_TRANSMISSION_BOT}", "-master=${TELEGRAM_USERNAME}", "-url=${TRANSMISSION_URL}", "-username=${TRANSMISSION_USERNAME}", "-password=${PASS}" ]
