FROM golang:1.13.5-alpine

# Update packages and install dependency packages for services
RUN apk update && apk add --no-cache bash git

# Change working directory
WORKDIR $GOPATH/src/gomicroservice/

# Install dependencies
ENV GO111MODULE on
COPY . ./
RUN go build ./...

ENV PORT 8080
ENV GIN_MODE release
EXPOSE 8080

CMD ["go", "run", "server.go"]
