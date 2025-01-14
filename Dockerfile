FROM golang:latest AS builder

WORKDIR /app

COPY *.go .
COPY go.* .

RUN CGO_ENABLED=0 go build -a -tags netgo --ldflags '-w' -v -o stress . 

FROM scratch

WORKDIR /app

COPY --from=builder /app/stress .

CMD ["./stress", "-logtostderr"]