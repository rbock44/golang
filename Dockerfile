FROM golang:1.7.1
ENV CGO_ENABLED=0
RUN go install -a net
ENV GOPATH /usr/app
ENTRYPOINT ["go"]
CMD ["help"]
