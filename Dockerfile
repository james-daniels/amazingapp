FROM golang:alpine as builder
RUN mkdir /build 
ADD . /build/
WORKDIR /build
RUN go build -o amazingapp .
FROM alpine
COPY --from=builder /build/amazingapp /app/
WORKDIR /app
EXPOSE 8080
ENTRYPOINT ["/app/amazingapp"]
CMD ["orange"]