FROM alpine:3.6

RUN apk update
RUN apk add bash
RUN apk add openjdk7-jre

COPY clean.sh  move_to_output.sh  run.sh /

WORKDIR /