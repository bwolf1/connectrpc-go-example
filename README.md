# connectrpc-go-kubernetes

Go service running in a Kubernetes cluster.

## Goals

- Get some quick familiarity with [connect-go](https://github.com/connectrpc/connect-go) and [buf](https://github.com/bufbuild/buf)
- Create a simple Kubernetes deployment
- Have a template to use for something else

## Running the service locally

```shell
go run cmd/server/main.go
```

## Making requests directly to the service running locally

### HTTP/REST

```shell
curl \
    --header "Content-Type: application/json" \
    --data '{"name": "Jane"}' \
    http://localhost:8080/greet.v1.GreetService/Greet
```

### gRPC

```shell
grpcurl \
    -protoset <(buf build -o -) -plaintext \
    -d '{"name": "Jane"}' \
    localhost:8080 greet.v1.GreetService/Greet
```

### Connect Client

```shell
go run ./cmd/client/main.go
```

## Deploying to K8s

```shell
./deploy.sh
```

### Verifying the deployment

```shell
kubectl get po -A
```

### Making Requests when deployed to K8s

```shell
kubectl port-forward deployment/greetservice-deployment 8080:8080
```

```shell
curl \
    --header "Content-Type: application/json" \
    --data '{"name": "Jane"}' \
    http://localhost:8080/greet.v1.GreetService/Greet
```
