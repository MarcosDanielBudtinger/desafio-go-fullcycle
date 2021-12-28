FROM golang:1.17 AS build_base

WORKDIR /tmp/appgo

COPY . .

RUN go mod init main.go && \
     go build -o ./out/appgo .

FROM golang:1.17-alpine

COPY --from=build_base /tmp/appgo/out/appgo /app/appgo

CMD ["/app/appgo"]
