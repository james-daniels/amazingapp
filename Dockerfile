FROM golang:alpine
RUN mkdir /app 
ADD . /app/
WORKDIR /app 
RUN go build -o amazingapp .
CMD ["./amazingapp", "green"]
EXPOSE 8080