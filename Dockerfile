FROM golang:alpine as builder
RUN mkdir /build 
RUN apk add git && git clone https://github.com/james-daniels/amazingapp.git /build
WORKDIR /build
RUN go build -o amazingapp .
FROM alpine
COPY --from=builder /build/amazingapp /app/
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["/app/amazingapp"]
CMD ["red"]