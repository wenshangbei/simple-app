
FROM golang:1.18-ubi8

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN chgrp -R 0 /app && \
    chmod -R g+rwX /app

RUN CGO_ENABLED=0 GOOS=linux go build -o /app

EXPOSE 8080

CMD [ "/app" ]
