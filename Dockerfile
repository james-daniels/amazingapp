FROM alpine:latest
COPY amazingApp /
ENTRYPOINT ["./amazingApp", "blue"]
EXPOSE 8080