# golang version 1.19
FROM golang:alpine AS STG_BUILD1

# diretorio root no docker do projeto
WORKDIR /usr/src/app

# copia tudo da pasta fonte
COPY . .

RUN CGO_ENABLED=0 go build -o /app hello.go

FROM scratch
# diretorio root no docker do projeto

COPY --from=STG_BUILD1 /app .

# how to run with go run . command?
# CMD ["go","run","."] 
CMD ["/app"]
