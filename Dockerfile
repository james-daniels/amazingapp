FROM golang:alpine
RUN mkdir /app 
ADD . /app/
WORKDIR /app 
RUN go build -o amazingapp .
COPY amazingapp /
ENTRYPOINT ["./amazingapp", "blue"]
EXPOSE 8080