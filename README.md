# connectrpc-go-example

Built using the [official tutorial](https://connectrpc.com/docs/go/getting-started/)

## Goals

- Get some quick familiarity with [connect-go](https://github.com/connectrpc/connect-go) and [buf](https://github.com/bufbuild/buf)
- Have a template to use for something else

## Running the Server

```shell
cd connect-go-example
go run cmd/server/main.go
```

## Making Requests

### HTTP/REST

```shell
cd connect-go-example
curl \
    --header "Content-Type: application/json" \
    --data '{"name": "Jane"}' \
    http://localhost:8080/greet.v1.GreetService/Greet
```

### gRPC

```shell
cd connect-go-example
grpcurl \
    -protoset <(buf build -o -) -plaintext \
    -d '{"name": "Jane"}' \
    localhost:8080 greet.v1.GreetService/Greet
```

### Connect Client

```shell
cd connect-go-example
go run ./cmd/client/main.go
```
