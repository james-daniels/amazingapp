FROM golang:alpine as builder
RUN mkdir /build 
ADD . /build/
WORKDIR /build
RUN go build -o amazingapp .
FROM alpine
RUN adduser amazinguser -s /sbin/nologin
COPY --from=builder /build/amazingapp /app/
WORKDIR /app
EXPOSE 8080
USER amazinguser
ENTRYPOINT ["/app/amazingapp"]