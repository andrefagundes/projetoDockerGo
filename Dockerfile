FROM golang:1.21.3 as builder

WORKDIR /app

COPY ./app /app

RUN CGO_ENABLED=0 GOOS=linux go build -o main

FROM scratch

COPY --from=builder /app/main /main

EXPOSE 8080

CMD ["/main"]