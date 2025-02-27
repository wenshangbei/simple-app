
FROM golang:1.18-ubi8

WORKDIR /app

RUN chgrp -R 0 /app && \
    chmod -R g+rwX /app

COPY go.mod ./
RUN go mod download

COPY *.go ./



RUN CGO_ENABLED=0 GOOS=linux go build -o /app

EXPOSE 8080

CMD [ "/app/simple-app" ]
