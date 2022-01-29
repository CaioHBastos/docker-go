FROM golang:alpine3.15 AS stage_go_build

WORKDIR /go/app
COPY app /go/app

RUN go mod init app && \
    go build full-cycle-app.go

FROM scratch

COPY --from=stage_go_build /go/app/full-cycle-app /

ENTRYPOINT [ "/full-cycle-app" ]