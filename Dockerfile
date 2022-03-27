FROM golang:1.18.0-alpine3.15 AS buildStage
WORKDIR /go/src
ADD . /go/src
RUN cd /go/src/cmd/main && go build -o main

FROM alpine:latest
WORKDIR /app
COPY --from=buildStage /go/src/cmd/main/main /app/
EXPOSE 9010
ENTRYPOINT ./main
