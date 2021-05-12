FROM mttchpmn07/cgo_alpine_build:latest AS build
WORKDIR /tmp/app/
COPY ./app/* /tmp/

RUN go mod install
RUN CGO_ENABLED=1 go build -o app

FROM alpine:edge AS prod
WORKDIR /app/
COPY -from=build /tmp/app .

CMD ["./app"]
