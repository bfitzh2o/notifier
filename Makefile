GOOS = linux
GOARCH = arm
GOBIN := $(GOPATH)/bin
GOLANGCILINT := $(GOBIN)/golangci-lint
GOSEC := $(GOBIN)/gosec
GHR := $(GOBIN)/ghr
RELEASEDIR ?= release/
ARTIFACT_NAME := notifier
CIRCLE_PROJECT_REPONAME ?= $(ARTIFACT_NAME)
export GO111MODULE=on

.PHONY: build release clean test lint dependencies
build: lint clean
	mkdir -p $(RELEASEDIR)
	GOOS=$(GOOS) GOARCH=$(GOARCH) go build -o $(RELEASEDIR)$(ARTIFACT_NAME) -v

release: build
	export CIRCLE_TAG=$(CIRCLE_TAG)
ifeq ($(strip $(GITHUB_TOKEN)),)
	@echo "GITHUB_TOKEN must be provided"
	@exit 0
else ifeq ($(strip $(CIRCLE_TAG)),)
	@echo "CIRCLE_TAG must be set"
	@exit 0
else
	ghr -u $(CIRCLE_PROJECT_USERNAME) -r $(CIRCLE_PROJECT_REPONAME) -c $(CIRCLE_SHA1) -delete $(CIRCLE_TAG) $(RELEASEDIR)
endif

clean:
	rm -rf $(RELEASEDIR)

test: lint
	go test -v -cover ./...

lint: go.mod dependencies
	go mod tidy
	golangci-lint run ./...
	gosec ./...

go.mod:
ifeq (,$(wildcard go.mod))
	go mod init
endif

dependencies: $(GOLANGCILINT) $(GOSEC) $(GHR)

$(GOLANGCILINT):
	go get -u github.com/golangci/golangci-lint/cmd/golangci-lint@v1.22.2

$(GOSEC):
	go get -u github.com/securego/gosec/cmd/gosec

$(GHR):
	go get -u github.com/tcnksm/ghr
