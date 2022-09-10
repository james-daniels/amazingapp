FROM alpine
COPY amazingApp /
ENTRYPOINT ["./amazingApp", "blue"]
EXPOSE 8080