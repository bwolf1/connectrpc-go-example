# connectrpc-go-example

Built originally based on the official tutorial @ <https://connectrpc.com/docs/go/getting-started/>

## Goals

Get familiar with [ConnectRPC](https://connectrpc.com/)

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
