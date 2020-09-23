COMMIT_ID=$(shell git rev-parse --short HEAD)
VERSION=$(shell cat VERSION)

NAME=odoh-client

all: clean build

clean:
	@echo "Cleaning and removing the odoh-client ..."
	@rm -f odoh-client

build: clean
	@echo "Building the binary for odoh-client ..."
	@echo "Tag: $(COMMIT_ID)"
	@echo "Version: $(VERSION)"
	@go build -mod=vendor -ldflags "-X main.Version=$(VERSION) -X main.CommitId=$(COMMIT_ID)" ./cmd/*

install:
	@go install -mod=vendor -ldflags "-X main.Version=$(VERSION) -X main.CommitId=$(COMMIT_ID)" ./cmd/*

.PHONY: all clean build install