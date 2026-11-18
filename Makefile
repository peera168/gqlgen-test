BINARY  := bin/server
PORT    ?= 8080

.DEFAULT_GOAL := help

.PHONY: help generate build run dev test fmt vet tidy clean

help: ## แสดงคำสั่งทั้งหมด
	@grep -E '^[a-zA-Z_-]+:.*?## ' $(MAKEFILE_LIST) | \
		awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

generate: ## generate โค้ด gqlgen จาก graph/*.graphqls
	go tool gqlgen generate

build: ## build binary ไปที่ bin/server
	go build -o $(BINARY) .

run: build ## build แล้วรัน server (PORT=8080)
	PORT=$(PORT) ./$(BINARY)

dev: generate ## generate แล้วรันด้วย go run
	PORT=$(PORT) go run .

test: ## รัน test ทั้งหมด
	go test ./...

fmt: ## จัด format โค้ด
	go fmt ./...

vet: ## ตรวจโค้ดด้วย go vet
	go vet ./...

tidy: ## จัดการ go.mod / go.sum
	go mod tidy

clean: ## ลบไฟล์ build
	rm -rf bin
