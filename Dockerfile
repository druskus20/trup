FROM golang:1.14-alpine

RUN mkdir /app

WORKDIR /app

ADD go.mod go.sum /app/
RUN go mod download

COPY db /app/db
COPY command /app/command
COPY *.go /app/
RUN go build -o main .

CMD ["/app/main"]
