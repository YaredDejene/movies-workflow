FROM alpine:3.6

RUN apk update
RUN apk add bash

COPY format_csv.sh  move_to_output.sh  run.sh /

WORKDIR /
