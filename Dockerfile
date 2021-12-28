FROM golang:1.17-alpine AS build_base

WORKDIR /go/src/app

COPY . .

RUN go build main.go

FROM scratch

WORKDIR /home

COPY --from=build_base /go/src/app/main .

CMD [ "./main" ]
