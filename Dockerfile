
FROM golang:1.18-ubi8

WORKDIR /app

COPY go.mod ./
RUN go mod download

COPY *.go ./

RUN chgrp -R 0 /api && \
    chmod -R g+rwX /api

RUN CGO_ENABLED=0 GOOS=linux go build -o /api

EXPOSE 8080

CMD [ "/api" ]
