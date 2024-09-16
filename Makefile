m ?= $(shell date +%Y-%m-%d)
c ?= $(shell date +%Y-%m-%d)

v_find:
	sudo /usr/local/vcpkg/vcpkg search "$(p)"
v_install:
	sudo /usr/local/vcpkg/vcpkg install

.PHONY: build start
all: build start
build:
	docker compose build
build_no_cache:
	docker compose build --no-cache
stop:
	docker compose down
down:
	docker compose down
run:
	docker compose up -d
up:
	docker compose up -d
start:
	docker compose up -d
build_start:
	docker compose build
rebuild: down build_no_cache up
	echo "rebuild"