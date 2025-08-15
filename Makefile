all: build docker

build:
	@CGO_ENABLED=0 go build --ldflags '-extldflags "-static"' -v -o stress .

docker:
	@docker build -t stress:latest .

.PHONY: docker build all
