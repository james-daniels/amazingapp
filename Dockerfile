FROM golang:alpine
RUN mkdir /app 
ADD . /app/
WORKDIR /app 
RUN go build -o amazingapp .
CMD ["./amazingapp", "blue"]
EXPOSE 8080