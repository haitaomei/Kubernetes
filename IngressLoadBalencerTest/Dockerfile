FROM golang
WORKDIR /
COPY . /
RUN go build server.go
ENTRYPOINT [ "/server" ]