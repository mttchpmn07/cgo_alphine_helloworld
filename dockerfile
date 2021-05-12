FROM mttchpmn07/cgo_alpine_build:latest AS builder
WORKDIR /tmp/app/
COPY ./app/* /tmp/app/

RUN go mod download
RUN CGO_ENABLED=1 go build -o app

FROM alpine:edge AS prod
WORKDIR /app/
COPY --from=builder /tmp/app/app .

CMD ["./app"]
